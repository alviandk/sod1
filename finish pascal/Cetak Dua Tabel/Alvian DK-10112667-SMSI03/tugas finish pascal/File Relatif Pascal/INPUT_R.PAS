uses crt;

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
       i,j     	: integer;
       lagi     : char;

      begin
            assign (file_mhs,'D:\f_mhs.dat');
           rewrite(file_mhs);
           i:=0;
           repeat
               
              clrscr;
              writeln('Mengisi tanggal pada File Mhs.dat');
              writeln;
              writeln('Mengisi tanggal ke ',i+1);
              writeln;
              begin
                   write('Nama                        : ');readln(mhs[i].nama);
                   write('Npm                         : ');readln(mhs[i].npm);
                   write('Tanggal Lahir(dd/mm/yyyy)   : ');read(mhs[i].tgl_lhr);
                   write('No Rumah                    : ');readln(mhs[i].no_rumah);
              end;
              write(file_mhs,mhs[i]);
              i:=i+1;
			  writeln;
              write('Isi lagi?(y/t) : ');readln(lagi);
        until lagi = 't';
        clrscr;
        close(file_mhs);
   end.
