char *some_buffer()
{
	char buffer[16];
	buffer[0] = 'a';
	buffer[1] = 'b';
	buffer[2] = 'c';
	return buffer;
}

int main()
{
	// b is a wild pointer, meaning that it is invalid
	// it should not be used in any way
	char *b = some_buffer();
	b[0] = 'd';
	return 0;
}
