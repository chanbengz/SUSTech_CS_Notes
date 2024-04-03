add = "Add to left part"
noaction = "No Action"

def padandsplit(str):
	str = str[2:]
	while len(str) < 16:
		str = '0' + str
	str_list = list(str)
	str_list.insert(4, ' ')
	str_list.insert(9, ' ')
	str_list.insert(14, ' ')
	return ''.join(str_list)

prod = 0x14
mcand = 0x62

for i in range(1, 9):
	op = ''
	prod_str = bin(prod)[2:]
	if prod_str[-1] == '1':
		op = add
		prod += mcand << 8
	else:
		op = noaction
	old_prod = prod
	prod = prod >> 1
	print(f"table.cell(rowspan: 2, align: horizon)[{i}], [{op}], [0110 0010], [{padandsplit(bin(old_prod))}], [Rshift Prod], [0110 0010], [{padandsplit(bin(prod))}],")