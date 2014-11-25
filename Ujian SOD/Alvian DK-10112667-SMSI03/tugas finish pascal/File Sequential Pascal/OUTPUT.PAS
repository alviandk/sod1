uses crt;
    const
    garis='--------------------------------------------------------------------';

    type
          nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;
    end;

   var
      file_nilai           : file of nilai;
      nilai_mhs           : nilai;
      i,j,jm               : integer;
      lagi                 : char;

   begin
     assign(file_nilai,'D:\Mhs.dat');
     reset(file_nilai);
     jm:=filesize(file_nilai);
     clrscr;
     writeln(' ':25,'Data Mahasiswa SMSI03');
     writeln(' ':25,'---------------------');
     writeln;
     writeln(garis);
     writeln('|No|       Nama       |     NPM     |  Tanggal Lahir  |  No Rumah  |');
     writeln(garis);
     for j:= 1 to jm do
     begin
          gotoxy(1,wherey);write('|',j);gotoxy(4,wherey);write('|');
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
             gotoxy(6,wherey);write(nama);
             gotoxy(23,wherey);write('|  ',npm);
             gotoxy(37,wherey);write('| ',tgl_lhr);
             gotoxy(55,wherey);write('| ',no_rumah);gotoxy(68,wherey);write('|');
          end;
          writeln;
     end;

     writeln(garis);
     close(file_nilai);
     readln;
   end.
