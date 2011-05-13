module CCLicensed
  def self.included mod
    class << mod
      @@licenses = %w{PublicDomain Attribution Attribution-ShareAlike Attribution-NoDerivs
                      Attribution-NonCommercial Attribution-NonCommercial-ShareAlike
                      Attribution-NonCommercial-NoDerives}
    end
  end

  def set_lic(new_license)
    if !@@licenses.include? new_license
      raise "Unsupported Creative Commons License Type"
    end
    @license = new_license
  end

  def license
    @license
  end

  ...

end
