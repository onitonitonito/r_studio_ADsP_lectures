"""
This file contains the Harrison and Rubinfeld (1978) data corrected for a few
minor errors and augmented with the latitude and longitude of the observations.
This file appears under boston in the statlib index. One can obtain matlab and
spreadsheet versions of the information below from www.finance.lsu/re under
spatial statistics links.

Harrison, David, and Daniel L. Rubinfeld, Hedonic Housing Prices and the Demand
for Clean Air, Journal of Environmental Economics and Management,
Volume 5, (1978), 81-102. Original data.

Gilley, O.W., and R. Kelley Pace, On the Harrison and Rubinfeld Data,
Journal of Environmental Economics and Management, 31 (1996), 403-405.
Provided corrections and examined censoring.
Pace, R. Kelley, and O.W. Gilley, Using the Spatial Configuration of the Data
to Improve Estimation, Journal of the Real Estate Finance and Economics 14
(1997), 333-340. Added georeferencing and spatial estimation.
"""

# http://pythonstudy.xyz/python/article/207-CSV-파일-사용하기
# 자료 리스트를 한줄 한줄 저장할 경우, import csv
# 판다스 df 를 한꺼번에 csv 화일로 저장할 경우, 아래 참조
# 판다스 DataFrame을 csv로 저장하고 로드하기 = http://buttercoconut.xyz/74
import os
import sys
import csv

import numpy as np
import pandas as pd

# '루트'와 '작업'디렉토리 설정 - for 스크립트런
DIRS = os.path.dirname(__file__).partition("r_studio_ADsP_lectures")
ROOT = DIRS[0] + DIRS[1]
sys.path.append(ROOT)

# -------------------------------------------------------------
WORK_DIR = os.path.join(ROOT, "_static", "_made_static", "")

# boston_corrected.txt 화일에서 읽어서 data 리스트 화일에 담는다.
with open(WORK_DIR + "boston_corrected.txt", mode='r') as f:
        data = f.readlines()

# print(data[9]);   quit()        # 1-string 읽어옴 9th line = columns
# print(len(data)); quit()        # 자료의 갯수 = 516개 / 1~10 까지는 자료설명

description = ""
for n in range(9):                  # 0~8까지 9라인 설명 --> description 저장
    description += data[n]


columns = data[9].split()
df = pd.DataFrame(columns=columns)

for n in range(516-10):                       # 516개 - 9개 만큼 반복한다.
    one_line = data[10+n].split()            # 앞 번호를 빼고, 뒷 자료만 이용한다
    feed_dict = {
        col : val for col, val in zip(columns, one_line)}
    df = df.append(feed_dict, ignore_index=True)

# print(__doc__)
print(description)
print(df.shape)         # 자료의 갯수 (506,21)

# print(df['TOWN#'])
# print(df['CRIM'])

# https://vincentarelbundock.github.io/Rdatasets/datasets.html
# 원본(boston_corrected)= http://lib.stat.cmu.edu/datasets/boston_corrected.txt
# # of columns = 21, as below.
[
    'OBS.', 'TOWN', 'TOWN#', 'TRACT', 'LON',
    'LAT', 'MEDV', 'CMEDV', 'CRIM', 'ZN',
    'INDUS', 'CHAS', 'NOX', 'RM', 'AGE',
    'DIS', 'RAD', 'TAX', 'PTRATIO', 'B',
    'LSTAT'
]


df.to_csv(WORK_DIR+"bostonc_txt_new.csv")
