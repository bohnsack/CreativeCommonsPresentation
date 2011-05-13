# Test Suite for Creative Commons Usage Management Example
# http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing

$:.unshift File.join( %w{ ../ } )

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

    def test_pd_domain_book
        assert  @b_pd.share?(:attr => true,  :comm => true,  :deriv => true,  :sa => true)
        assert  @b_pd.share?(:attr => true,  :comm => true,  :deriv => true,  :sa => false)
        assert  @b_pd.share?(:attr => true,  :comm => true,  :deriv => false, :sa => true)
        assert  @b_pd.share?(:attr => true,  :comm => true,  :deriv => false, :sa => false)
        assert  @b_pd.share?(:attr => true,  :comm => false, :deriv => true,  :sa => true)
        assert  @b_pd.share?(:attr => true,  :comm => false, :deriv => true,  :sa => false)
        assert  @b_pd.share?(:attr => true,  :comm => false, :deriv => false, :sa => true)
        assert  @b_pd.share?(:attr => true,  :comm => false, :deriv => false, :sa => false)
        assert  @b_pd.share?(:attr => false, :comm => true,  :deriv => true,  :sa => true)
        assert  @b_pd.share?(:attr => false, :comm => true,  :deriv => true,  :sa => false)
        assert  @b_pd.share?(:attr => false, :comm => true,  :deriv => false, :sa => true)
        assert  @b_pd.share?(:attr => false, :comm => true,  :deriv => false, :sa => false)
        assert  @b_pd.share?(:attr => false, :comm => false, :deriv => true,  :sa => true)
        assert  @b_pd.share?(:attr => false, :comm => false, :deriv => true,  :sa => false)
        assert  @b_pd.share?(:attr => false, :comm => false, :deriv => false, :sa => true)
        assert  @b_pd.share?(:attr => false, :comm => false, :deriv => false, :sa => false)
    end

    def test_by_domain_book
        assert  @b_by.share?(:attr => true,  :comm => true,  :deriv => true,  :sa => true)
        assert  @b_by.share?(:attr => true,  :comm => true,  :deriv => true,  :sa => false)
        assert  @b_by.share?(:attr => true,  :comm => true,  :deriv => false, :sa => true)
        assert  @b_by.share?(:attr => true,  :comm => true,  :deriv => false, :sa => false)
        assert  @b_by.share?(:attr => true,  :comm => false, :deriv => true,  :sa => true)
        assert  @b_by.share?(:attr => true,  :comm => false, :deriv => true,  :sa => false)
        assert  @b_by.share?(:attr => true,  :comm => false, :deriv => false, :sa => true)
        assert  @b_by.share?(:attr => true,  :comm => false, :deriv => false, :sa => false)
        assert !@b_by.share?(:attr => false, :comm => true,  :deriv => true,  :sa => true)
        assert !@b_by.share?(:attr => false, :comm => true,  :deriv => true,  :sa => false)
        assert !@b_by.share?(:attr => false, :comm => true,  :deriv => false, :sa => true)
        assert !@b_by.share?(:attr => false, :comm => true,  :deriv => false, :sa => false)
        assert !@b_by.share?(:attr => false, :comm => false, :deriv => true,  :sa => true)
        assert !@b_by.share?(:attr => false, :comm => false, :deriv => true,  :sa => false)
        assert !@b_by.share?(:attr => false, :comm => false, :deriv => false, :sa => true)
        assert !@b_by.share?(:attr => false, :comm => false, :deriv => false, :sa => false)
    end

    def test_licenses_were_assigned_correctly
        assert_equal @b_pd.license,       'PublicDomain',                         'License not correct'
        assert_equal @b_by.license,       'Attribution',                          'License not correct'
        assert_equal @b_by_sa.license,    'Attribution-ShareAlike',               'License not correct'
        assert_equal @b_by_nd.license,    'Attribution-NoDerivs',                 'License not correct'
        assert_equal @b_by_nc.license,    'Attribution-NonCommercial',            'License not correct'
        assert_equal @b_by_nc_sa.license, 'Attribution-NonCommercial-ShareAlike', 'License not correct'
        assert_equal @b_by_nc_nd.license, 'Attribution-NonCommercial-NoDerives',  'License not correct'
    end
end
