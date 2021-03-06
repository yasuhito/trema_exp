#
# Copyright (C) 2008-2012 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require "trema/action"
require "trema/monkey-patch/integer"


module Trema
  #
  # An action to set an experimenter action.
  #
  class ExperimenterAction < Action
    #
    # @return [Array<Fixnum>] the value of attribute {#body} that represents
    #   binary data as an array of bytes.
    #
    attr_reader :body
    # @return [Integer] the value of attribute {#experimenter}
    attr_reader :experimenter


    #
    # Creates an action to set an experimenter action.
    #
    # @example
    #   ExperimenterAction.new( 0x00004cff, "deadbeef".unpack( "C*" ) )
    #
    # @param [Integer] experimenter_id
    #   the experimenter identifier.
    # @param [Array] body
    #   experimenter-defined arbitrary additional data.
    #
    # @raise [TypeError] if experimenter is not an Integer.
    # @raise [ArgumentError] if experimeter is not an unsigned 32-bit Integer.
    # @raise [TypeError] if body is not an Array.
    #
    def initialize experimenter, body = nil
      validate_create :experimenter, :presence => true, :validate_with => "check_unsigned_int", :value =>experimenter
      validate_create :body, :validate_with => "check_body", :value => body
    end


    def check_body body, name
      if ( not body.nil? )  and ( not body.is_a?( Array ) )
        raise TypeError, "#{ name } must be an Array"
      end
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
