uses crt;
type
    nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;

    end;

var
   file_nilai           : file of nilai;
   nilai_mhs            : nilai;
   i,it,j                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];
Begin  
	Lagi:='Y'; 
	 	
		
	Repeat 
	Clrscr;
	Assign(File_nilai,'D:\Mhs.Dat');
	Reset(File_nilai);
	If IOResult<>0 Then 
		Rewrite(file_nilai); 
	
	Clrscr; 
		Assign(FileTmp,'D:\tmp.dat');
		Rewrite(FileTmp);

		Ada:=False; 
		i:=0; 
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('Ingin Menginsert pada Posisi Data ke          : ');Readln(j);
		
		clrscr;
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
	While (Ada=False) And (i<>Filesize(file_nilai)) Do
		Begin 
			Seek(file_nilai,i); 
			Read(file_nilai,nilai_mhs); 
			If nilai_mhs.NPM=npmcari Then 
				Ada:=True 
			Else 
				Inc(i); 
		End; 

	If (Ada=True) Then 
		Begin 
		Gotoxy(20,9);Write('NPM  "',npmcari,'"  Ini  Sudah Ada!'); 
		End 
	Else 
		if j>1 then
			Begin   {program utama} 
				for i:= 1 to j-1 do {copy atas insert}
				begin		
				Seek(file_nilai,i-1);
				read(file_nilai,nilai_mhs);
				write(filetmp,nilai_mhs);
				end;
			
				seek(filetmp,filesize(filetmp)); {insert}
				nilai_mhs.NPM:=npmcari; 
				Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(nilai_mhs.Nama); 	
				Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(nilai_mhs.tgl_lhr);
				Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(nilai_mhs.no_rumah);
				Write(filetmp,nilai_mhs);
	
				For i := j to Filesize(file_nilai) Do {copy bawah insert}
					Begin
						Seek(file_nilai,i-1);
						Read(file_nilai,nilai_mhs);
						seek(filetmp,i);
						Write(FileTmp,nilai_mhs);
					End;
			
				Assign(FileTmp,'D:\tmp.dat'); {ubah file}
				reset(filetmp);
				Assign(file_nilai,'D:\mhs.Dat');
				rewrite(file_nilai);
				For i := 1 to Filesize(filetmp) Do
					Begin
						Seek(filetmp,i-1);
						Read(filetmp,nilai_mhs);
						Write(File_nilai,nilai_mhs);
				end;
				close(file_nilai);
				close(filetmp);
				Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Insert!');
			end
		else
			begin
				seek(filetmp,0); {insert}
				nilai_mhs.NPM:=npmcari; 
				Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(nilai_mhs.Nama); 	
				Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(nilai_mhs.tgl_lhr);
				Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(nilai_mhs.no_rumah);
				Write(filetmp,nilai_mhs);
			For i := 1 to Filesize(file_nilai) Do {copy bawah insert}
				Begin
					Seek(file_nilai,i-1);
					Read(file_nilai,nilai_mhs);
					seek(filetmp,i);
					Write(FileTmp,nilai_mhs);
				End;
			Assign(FileTmp,'D:\tmp.dat'); {ubah file}
			reset(filetmp);
			Assign(file_nilai,'D:\mhs.Dat');
			rewrite(file_nilai);
			For i := 1 to Filesize(filetmp) Do
				Begin
					Seek(filetmp,i-1);
					Read(filetmp,nilai_mhs);
					Write(File_nilai,nilai_mhs);
				end;
			close(file_nilai);
			close(filetmp);
			Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Insert!');
		end;

	Gotoxy(20,10);Write('Mau  INSERT  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
End.
