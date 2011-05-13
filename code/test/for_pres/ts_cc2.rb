class MyFirstTest < Test::Unit::TestCase

    ...

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

    ...
end
