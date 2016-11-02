# encoding: utf-8
#
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

require 'csv'

module Janya
  module Export
    module CSV
      def self.generate(*args, &block)
        Base.generate(*args, &block)
      end

      class Base < ::CSV
        include Janya::I18n

        class << self

          def generate(&block)
            col_sep = l(:general_csv_separator)
            encoding = l(:general_csv_encoding)

            str = ''.force_encoding(encoding)
            if encoding == 'UTF-8'
              # BOM
              str = "\xEF\xBB\xBF".force_encoding(encoding)
            end

            super(str, :col_sep => col_sep, :encoding => encoding, &block)
          end
        end

        def <<(row)
          row = row.map do |field|
            case field
            when String
              Janya::CodesetUtil.from_utf8(field, self.encoding.name)
            when Float
              @decimal_separator ||= l(:general_csv_decimal_separator)
              ("%.2f" % field).gsub('.', @decimal_separator)
            else
              field
            end
          end
          super row
        end
      end
    end
  end
end
