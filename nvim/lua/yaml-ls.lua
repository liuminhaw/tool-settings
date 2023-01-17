require('lspconfig').yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci/*",
                --["/home/haw/25sprout/surveycake/Deploy/maketemplatejson/ci-schema.json"] = "/.gitlab-ci.yml"
            },
            customTags = {
                "!reference sequence",
            }
        }
    }
}
