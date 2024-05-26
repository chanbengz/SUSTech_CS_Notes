import signal
import sys
import cv2

from picamera2 import Picamera2, Preview, MappedArray

import time

picam2 = Picamera2()

green = (0, 255, 0)
red = (255, 0, 0)
font = cv2.FONT_HERSHEY_SIMPLEX
scale = 1
thickness = 2

def apply_timestamp(request):
    timestamp = time.strftime("%Y-%m-%d %X")
    with MappedArray(request, "main") as m:
        cv2.putText(m.array, "SWS3009B Trial Lecture", (130, 470), font, scale, red, thickness)
        cv2.putText(m.array, timestamp, (0, 30), font, scale, green, thickness)


picam2.pre_callback = apply_timestamp

camera_config = picam2.create_preview_configuration()
picam2.configure(camera_config)
picam2.start_preview(Preview.QTGL)
picam2.start()
time.sleep(20)
picam2.capture_file("classPhoto.jpg")
