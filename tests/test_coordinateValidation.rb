require 'test/unit'
require "yaml"

class TestCoordinateValidation < Test::Unit::TestCase

  def test_coordinatevalidation
    Dir["./_pins/*.json"].each do |path|
      f = YAML.load_file(path)
      [
        f["latitude"],
        f["longitude"],
      ].each do |s|
        assert_not_nil(s.to_s[/^-?\d+(?:\.\d+)?$/], path)
      end
    end

  end

  def test_frontmattervalidation
      Dir["./_pins/*.json"].each do |path|
          lines = File.readlines(path)
          assert_match(/^-+$/, lines[0])
          assert_match(/^-+$/, lines[-1])
      end
  end
end
