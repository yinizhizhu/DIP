#include <iostream>  
#include <windows.h>  
#include <stdio.h>  

using namespace std;
int bmpwidth, bmpheight, linebyte;
unsigned char *pBmpBuf;  //存储图像数据  

bool readBmp(char *bmpName) {
	FILE *fp;
	if ((fp = fopen(bmpName, "rb")) == NULL) { //以二进制的方式打开文件  
		cout << "The file " << bmpName << "was not opened" << endl;
		return FALSE;
	}
	if (fseek(fp, sizeof(BITMAPFILEHEADER), 0)) { //跳过BITMAPFILEHEADE  

		cout << "跳转失败" << endl;
		return FALSE;
	}
	BITMAPINFOHEADER infoHead;
	fread(&infoHead, sizeof(BITMAPINFOHEADER), 1, fp);   //从fp中读取BITMAPINFOHEADER信息到infoHead中,同时fp的指针移动  
	bmpwidth = infoHead.biWidth;
	bmpheight = infoHead.biHeight;
	linebyte = (bmpwidth * 24 / 8 + 3) / 4 * 4; //计算每行的字节数，24：该图片是24位的bmp图，3：确保不丢失像素
	pBmpBuf = new unsigned char[linebyte*bmpheight];
	fread(pBmpBuf, sizeof(char), linebyte*bmpheight, fp);
	fclose(fp);   //关闭文件  
	cout << bmpwidth << " * " << bmpheight << endl;
	cout << linebyte << endl;
	return TRUE;
}

void solve() {
	char readFileName[] = "2.bmp";
	if (FALSE == readBmp(readFileName))
		cout << "readfile error!" << endl;
}

int main()
{
	solve();
	return 0;
}