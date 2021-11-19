#!/usr/bin/env python3

"""
Lendo um arquivo netcdf de prec do CFS (que era grib) no Python com iris
"""

import cartopy.crs as ccrs
import iris, iris.analysis
import iris.plot as iplt
import numpy as np
import matplotlib.pyplot as plt
from iris.time import PartialDateTime
from iris.util import unify_time_units
from iris.experimental.equalise_cubes import equalise_attributes
from iris.coord_categorisation import add_day_of_year

prec_file = '/home/oem/Desktop/python_scripts/fractal/prate.01.2021111406.daily.nc'
pr = iris.load_cube(prec_file)

print(pr)

print('All times :\n' + str(pr.coord('Forecast offset from initial time')))

print(pr.coord('Forecast offset from initial time'))

#Daqui para baixo nao funcionou
pr1 = iris.Constraint(time=lambda cell: PartialDateTime(hour=6) < cell <
                      PartialDateTime(hour=24))
pr11 = pr.extract(pr1)
print(pr11)


hour_12 = iris.Constraint(time=lambda cell: cell.point.hour == 12)
pr12 = pr.extract(hour_12)
print(pr12)


# prec plot for 01/12/2021 - 00Z
pdt = PartialDateTime(year=2021, month=12, day=1)
d1 = iris.Constraint(time=lambda cell: cell.bound[0] == pdt)
pr1 = pr.extract(d1)

print(pr1)

