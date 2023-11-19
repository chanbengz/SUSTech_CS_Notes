import os
import magic

paths = os.walk(r'./CS305_LAB3')
mime = magic.Magic(mime=True)

for path, dir_lst, file_lst in paths:
    for file_name in file_lst:
        file = os.path.join(path, file_name)
        typ = mime.from_file(file)
        print(f"{file}: {typ}")
