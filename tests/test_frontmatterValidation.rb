require 'test/unit'
require 'yaml'

class TestFrontMatterValidation < Test::Unit::TestCase

    def test_frontmattervalidation
        patterns = [
            /^-{3,3}$/,
            /githubHandle:.+/i,
            /latitude:.+/i,
            /longitude:.+/i,
            /^-{3,3}$/,
        ]
        Dir['./_pins/*.json'].each do |path|
            lines = File.readlines(path)
            patterns.each_with_index do |pattern, index|
                assert_match(pattern, lines[index])
            end
        end
    end

end
