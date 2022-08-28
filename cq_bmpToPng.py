import sys
import os
# 转换图标格式
from PIL import Image
imgPngName = sys.argv[1]
imgBmpName = imgPngName.replace('png', 'bmp')
image = Image.open(imgBmpName)
image.save(imgPngName)
os.remove(imgBmpName)
