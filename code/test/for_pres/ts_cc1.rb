# Test Suite for Creative Commons Usage Management Example
# http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing

require 'test/unit'
require 'book'

class MyFirstTest < Test::Unit::TestCase
    def setup
        @b_pd = Book.new('Book0', 'Joe') ; @b_pd.set_lic('PublicDomain')

        @b_by = Book.new('Book1', 'Tom') ; @b_by.set_lic('Attribution')

        @b_by_sa = Book.new('Book2', 'Jon')
        @b_by_sa.set_lic('Attribution-ShareAlike')

        @b_by_nd = Book.new('Book3', 'Joe')
        @b_by_nd.set_lic('Attribution-NoDerivs')

        @b_by_nc = Book.new('Book4', 'Tom')
        @b_by_nc.set_lic('Attribution-NonCommercial')

        @b_by_nc_sa = Book.new('Book5', 'Jon')
        @b_by_nc_sa.set_lic('Attribution-NonCommercial-ShareAlike')

        @b_by_nc_nd = Book.new('Book6', 'Joe')
        @b_by_nc_nd.set_lic('Attribution-NonCommercial-NoDerives')
    end

    ...
end
