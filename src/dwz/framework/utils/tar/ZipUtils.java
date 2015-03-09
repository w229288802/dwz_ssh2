package dwz.framework.utils.tar;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class ZipUtils {
	static final int BUFFER = 2048;

	public static boolean unzip(String zipPath, String descDir) {
		boolean retCode = false;
		try {
			ZipFile zipFile = new ZipFile(zipPath);
			Enumeration<? extends ZipEntry> emu = zipFile.entries();

			while (emu.hasMoreElements()) {
				ZipEntry entry = (ZipEntry) emu.nextElement();
				// 会把目录作为一个file读出一次，所以只建立目录就可以，之下的文件还会被迭代到。
				if (entry.isDirectory()) {
					new File(descDir + entry.getName()).mkdirs();
					continue;
				}
				BufferedInputStream bis = new BufferedInputStream(zipFile
						.getInputStream(entry));
				File file = new File(descDir + entry.getName());
				// 加入这个的原因是zipfile读取文件是随机读取的，考试,大提示这就造成可能先读取一个文件。
				// 而这个文件所在的目录还没有出现过，所以要建出目录来。
				File parent = file.getParentFile();
				if (parent != null && (!parent.exists())) {
					parent.mkdirs();
				}
				FileOutputStream fos = new FileOutputStream(file);
				BufferedOutputStream bos = new BufferedOutputStream(fos, BUFFER);
				int count;
				byte data[] = new byte[BUFFER];
				while ((count = bis.read(data, 0, BUFFER)) != -1) {
					bos.write(data, 0, count);
				}
				bos.flush();
				bos.close();
				bis.close();
			}
			zipFile.close();
			retCode = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retCode;
	}

	public static boolean zip(String zipPath, String srcPath) {

		FileOutputStream fos;
		try {
			fos = new FileOutputStream(zipPath);
			return zip(fos, srcPath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		}

	}

	public static boolean zip(OutputStream out, String srcPath) {
		File f = new File(srcPath);
		if (f.isDirectory()){
			File files[] = f.listFiles();
			return zip(out, Arrays.asList(files));
		} else {
			List<File> files = new ArrayList<File>();
			files.add(f);
			return zip(out, files);
		}
	}

	public static boolean zip(OutputStream out, List<File> srcFiles) {
		boolean retCode = false;
		ZipOutputStream zout = null;
		try {
			zout = new ZipOutputStream(out);
			byte data[] = new byte[BUFFER];

			for (File f : srcFiles) {
				FileInputStream fi = new FileInputStream(f);

				ZipEntry entry = new ZipEntry(f.getName());
				zout.putNextEntry(entry);
				int count = -1;
				while ((count = fi.read(data, 0, BUFFER)) != -1) {
					zout.write(data, 0, count);
				}
				fi.close();
			}
			zout.close();
			retCode = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (zout != null) {
				try {
					zout.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				zout = null;
			}
		}

		return retCode;
	}
}