uses crt;
    const
    garis='--------------------------------------------------------------------';

    type
          tanggal = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;
    end;


   var
       file_mhs : file of tanggal;
       mhs  	: array[0..20] of tanggal;
       i,j,jm   : integer;
       lagi     : char;


   begin
     assign (file_mhs,'D:\f_mhs.dat');
     reset(file_mhs);
     jm:=filesize(file_mhs);
     clrscr;
     writeln(' ':25,'Data Mahasiswa SMSI03');
     writeln(' ':25,'---------------------');
     writeln;
     writeln(garis);
     writeln('|No|       Nama       |     NPM     |  Tanggal Lahir  |  No Rumah  |');
     writeln(garis);
     for j:= 0 to jm-1 do
     begin
          gotoxy(1,wherey);write('|',j+1,' |');
          read(file_mhs,mhs[j]);
          begin
             gotoxy(6,wherey);write(mhs[j].nama);
             gotoxy(23,wherey);write('|  ',mhs[j].npm);
             gotoxy(37,wherey);write('| ',mhs[j].tgl_lhr);
             gotoxy(55,wherey);write('| ',mhs[j].no_rumah);gotoxy(68,wherey);write('|');
          end;
          writeln;
     end;

     writeln(garis);
     close(file_mhs);
     readln;
   end.
