import std.stdio;
import std.file;
import std.format;
import std.string;
import std.range;
import std.algorithm;
import std.array;
import std.math;

// BMP file header (14 bytes).
struct BitmapFileHeader {
	char[2] signature;      // "BM" signature
	uint fileSize;          // Size of the file in bytes
	ushort reserved1;       // Reserved (0)
	ushort reserved2;       // Reserved (0)
	uint dataOffset;        // Offset to the start of image data
}

// BMP info header (40 bytes for BITMAPINFOHEADER).
struct BitmapInfoHeader {
	uint size;              // Size of this header (40 bytes)
	int width;              // Image width in pixels
	int height;             // Image height in pixels
	ushort planes;          // Number of color planes (must be 1)
	ushort bitsPerPixel;    // Bits per pixel (1, 4, 8, 16, 24, or 32)
	uint compression;       // Compression method (0 = none, 1 = RLE-8, 2 = RLE-4)
	uint imageSize;         // Size of the image data in bytes
	int xPixelsPerMeter;    // Horizontal resolution (pixels per meter)
	int yPixelsPerMeter;    // Vertical resolution (pixels per meter)
	uint colorsUsed;        // Number of colors in the palette
	uint importantColors;   // Number of important colors used (0 = all)
}

// RGB pixel structure.
struct RGB {
	ubyte blue;
	ubyte green;
	ubyte red;

	string toString() const {
		return format("RGB(%d, %d, %d)", red, green, blue);
	}
}

void main(string[] args) {
	if (args.length < 2) {
		writeln("Usage: main <filename.bmp>");
		return;
	}

	string fileName = args[1];

	try {
		// Read the file.
		auto file = File(fileName, "rb");

		// Read the BMP file header.
		BitmapFileHeader fileHeader;
		file.rawRead((&fileHeader)[0..1]);

		// Check if it's a valid BMP file
		if (fileHeader.signature != "BM") {
			writeln("Error: Not a valid BMP file");
			return;
		}

		// Read the BMP info header.
		BitmapInfoHeader infoHeader;
		file.rawRead((&infoHeader)[0..1]);

		// Display header information.
		writeln("BMP File Header Information:");
		writefln("  Signature: %s", fileHeader.signature);
		writefln("  File Size: %d bytes", fileHeader.fileSize);
		writefln("  Data Offset: %d bytes", fileHeader.dataOffset);

		writeln("\nBMP Info Header Information:");
		writefln("  Header Size: %d bytes", infoHeader.size);
		writefln("  Image Width: %d pixels", infoHeader.width);
		writefln("  Image Height: %d pixels", infoHeader.height);
		writefln("  Color Planes: %d", infoHeader.planes);
		writefln("  Bits Per Pixel: %d", infoHeader.bitsPerPixel);

		// Display compression method.
		string compressionMethod;
		switch (infoHeader.compression) {
			case 0: compressionMethod = "None (BI_RGB)"; break;
			case 1: compressionMethod = "RLE-8 (BI_RLE8)"; break;
			case 2: compressionMethod = "RLE-4 (BI_RLE4)"; break;
			case 3: compressionMethod = "Bitfields (BI_BITFIELDS)"; break;
			default: compressionMethod = format("Unknown (%d)", infoHeader.compression);
		}
		writefln("  Compression: %s", compressionMethod);

		writefln("  Image Size: %d bytes", infoHeader.imageSize);
		writefln("  Horizontal Resolution: %d pixels/meter", infoHeader.xPixelsPerMeter);
		writefln("  Vertical Resolution: %d pixels/meter", infoHeader.yPixelsPerMeter);
		writefln("  Colors Used: %d", infoHeader.colorsUsed);
		writefln("  Important Colors: %d", infoHeader.importantColors);

		// Calculate color depth information.
		int numColors = (infoHeader.bitsPerPixel <= 8) ? (1 << infoHeader.bitsPerPixel) : 0;
		if (numColors > 0) {
			writefln("  Color Palette: %d colors", numColors);
		} else {
			writefln("  Color Palette: None (direct color)");
		}
	} catch (Exception e) {
		writefln("Error reading BMP file: %s", e.msg);
	}
}
