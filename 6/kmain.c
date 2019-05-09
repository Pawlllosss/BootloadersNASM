void kmain()
{
    const char color = 5;
    char* hello = "I am written in c";
    char* video = ((char*)0xb8000);

    while(*hello != '\0') {
		*video = *hello;
		video++;
		hello++;
		*video = color;
		video++;
    }
}
