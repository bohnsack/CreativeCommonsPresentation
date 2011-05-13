module CCLicensed

  ...

  # Creative Commons share logic
  def share?(option = {})
    attribution = option[:attr]  || false
    commercial  = option[:comml] || false
    derivative  = option[:deriv] || false
    share_alike = option[:sa]    || false

    # Can't share CC-liecensed works without attribution, unless Public Domain
    if(!attribution && !@license.eql?('PublicDomain'))
      return false
    end

    # Can't share CC-licensed works "remixed", if under and non-deriv license
    if(derivative &&
       %w{Attribution-NoDerivs Attribution-NonCommercial-NoDerives}.include?(@license))
      return false
    end

    ...

  end

end
