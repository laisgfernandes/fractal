#!/usr/bin/env python3

"""
Lendo um arquivo grib de prec do CFS no Python com xarray
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import xarray as xr

pr = xr.open_dataset('prate.01.2021111406.daily.grb2', engine='pynio')

pr =  pr.get("Precipitation rate")

pr.to_netcdf("prate.01.2021111406.daily.nc")

