# Janya - project management software
# Copyright (C) 2006-2016  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

require File.expand_path('../../../../../test_helper', __FILE__)

class Janya::WikiFormatting::TextileHtmlParserTest < ActiveSupport::TestCase

  def setup
    @parser = Janya::WikiFormatting::Textile::HtmlParser
  end

  def test_should_convert_tags
    assert_equal 'A *simple* html snippet.',
      @parser.to_text('<p>A <b>simple</b> html snippet.</p>')
  end
end
