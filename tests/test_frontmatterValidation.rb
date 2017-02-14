require 'test/unit'
require 'yaml'

class TestFrontMatterValidation < Test::Unit::TestCase

    def test_frontmattervalidation
        Dir['./_pins/*.json'].each do |path|
            data = YAML.load_file(path)

            keys = data.keys.map { |k| k.downcase }
            assert_true(keys.include? "githubhandle")
            assert_true(keys.include? "latitude")
            assert_true(keys.include? "longitude")

            lines = File.readlines(path)
            assert_equal("---\n", lines[0])
            assert_true(lines[4..-1].include? "---\n")
        end
    end

end
