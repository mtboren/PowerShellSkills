## based on Jeff Brown examples (https://github.com/JeffBrownTech/pester-examples/)
Import-Module $PSScriptRoot\PSSomethingModule.psm1 -Force

Describe "Function 'Get-Something'" {
    Context "verify module has defined functions" {
        BeforeAll -Scriptblock {$moduleFunctions = (Get-Module PSSomethingModule).ExportedFunctions.Keys}
        it "should have a 'Get-Something' function" {
            $moduleFunctions | Should -Contain 'Get-Something'
        }
    }

    Context "testing parameter ThingToGet" {
        It "should have a parameter named ThingToGet with various attributes" {
            $ThisFunction = Get-Command Get-Something
            $ThisFunction | Should -HaveParameter ThingToGet -Type String
            $ThisFunction | Should -HaveParameter ThingToGet -DefaultValue "something"
            $ThisFunction | Should -HaveParameter ThingToGet -Not -Mandatory
        }
    }

    Context "when parameter ThingToGet is not used" {
        BeforeAll -Scriptblock {$ReturnedObject = Get-Something}
        It "should return 'I got something!'" {
            $ReturnedObject | Should -Be 'I got something!'
        }

        It "should be a string object" {
            $ReturnedObject | Should -BeOfType System.String
        }
    }

    Context "when parameter ThingToGet is used" {
        ## docs for -ForEach at https://pester.dev/docs/usage/data-driven-tests
        $arrTestCaseHshes = Write-Output 'a brewski 🍺' 'a pizza 🍕' | Foreach-Object {@{strParamValue = $_; ReturnedObject = Get-Something -ThingToGet $_}}
        It "should return 'I got' followed by parameter value '<strParamValue>'" -Foreach $arrTestCaseHshes -Test {
            $ReturnedObject | Should -Be "I got $strParamValue!"
        }

        It "should be a string" -Foreach $arrTestCaseHshes -Test {
            $ReturnedObject | Should -BeOfType System.String
        }
    }
}
