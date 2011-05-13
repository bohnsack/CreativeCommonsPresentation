class MyFirstTest < Test::Unit::TestCase

    ...

    def test_by_book
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

    ...

end
