program LR1_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
N=1000;
numbers=[0..200];

type Trec= record
    number: Integer;
    str: string[15];
    func: Boolean;
  end;

 TMAS = array [1.. N] of Trec;

 procedure row;
 begin
 Writeln('------------------------------');
 end;

procedure ArrayGeneration( var A:TMAS);
 var  i:Integer;
   begin
      //Randomize;
     for i:=1 to N do
      begin
        with A[i] do
        begin
         number:=Random(201);
         str:='my_test_'+IntToStr(i);
         func:=false;
        end;
      end;
   end;

procedure Output(const A:TMAS);
var  i:Integer;
   begin

        for i:=1 to N do
      begin
        with A[i] do
        begin
         writeln(number:5,str:14,func:7);
        end;
      end;
   end;

      procedure Swap( var A,B:Trec);
   var temp: Trec;
    begin
      temp:=A;
      A:=B;
      B:=temp;
    end;



 procedure SortNumbers(var A:TMAS);
     var i,j,min:integer;
   begin
     for i:=1 to N-1 do

       begin
        min:=i;
        for j:=i+1 to N do
         
          begin
           if A[j].number<A[min].number then min:=j
             else
              if A[j].number=A[min].number then
                  if A[j].str<A[min].str then min:=j;
          end;
        Swap(A[i],A[min]);
       end;
   end;

    procedure SortStr(var A:TMAS);
     var i,j,min:integer;
   begin
     for i:=1 to N-1 do

       begin
        min:=i;
        for j:=i+1 to N do
           if (A[j].str<A[min].str)   then min:=j;
        Swap(A[i],A[min]);
       end;
   end;

   function NumbOfTrue(var A:TMAS):Integer;
var
  i:integer;
begin
  Result:=0;
  for i:= 1 to N do
  begin
    if(A[i].Func = True) then
      Inc(Result);
  end;
end;

procedure MakeAllFalse(var A:TMAS);
var
  i:Integer;
begin
  for i:=1 to N do
  begin
      A[i].Func := false;
  end;
end;

procedure BinSearchStr(var A:TMAS; const element:string);
var
  left, right, middle:integer;
  flag:Boolean;

begin

  left:=1;
  right:=N;
  flag:=true;
  while (left <= right) and flag do
  begin
    middle := (left + right) div 2;
    A[middle].func:= true;
    if (A[middle].str = element) then
      flag:=False

    else
    begin
      if (A[middle].str > element) then
        right := middle - 1
      else
        left := middle +1;
    end;
  end;
  if flag then
    writeln('Not found')
  else
   begin
    Writeln('Element index: ' + IntToStr(middle));
    Writeln(A[middle].number:5,A[middle].str:14,A[middle].Func:7);
    end;
end;


procedure BinSearchNum(var A:TMAS; const element:Integer);
var
  left, right, middle,temp:integer;
  flag:Boolean;
begin

  Writeln('Matching entries with a number equal to ', element,' :');
  left:=1;
  right:=N;
  flag:=True;
  while (left <= right) and flag do
  begin
    middle := (left + right) div 2;
    A[middle].func := true;
    if ((A[middle].number) = element) then
     flag:=False
    else
    begin
      if (A[middle].number > element) then
        right := middle - 1
      else
        left := middle +1;
    end;
  end;
  if flag then
    writeln('Not found')
  else
  begin
    temp:= middle;
    while(A[temp].number = element) and (temp>0) do
    begin
      Dec(temp);
    end;
    A[temp].func := true;
    inc(temp);

    while(A[temp].number = element)  do
    begin
      A[temp].func:= true;
      Writeln(A[temp].number:5,A[temp].str:14,A[temp].Func:7);
      inc(temp);
    end;
  end;
end;



var M:TMAS;
  s:string;
  e:Integer;
BEGIN
   ArrayGeneration(M);                        //step 1
   Output(M);                                 //step 2
   row;
   Readln;
   SortStr(M);                                //step 3
   Output(M);                                 //step 4
   row;
   Readln;
   Writeln('Enter string');
   Readln (s);
   BinSearchStr(M,s);                         //step 5
   row;
   Readln;
   Output(M);                                 //step 6_1
   row;
   Readln;
   if NumbOfTrue(M)=1 then Writeln (NumbOfTrue(M),' true element')
   else Writeln(NumbOfTrue(M),' true elements');   //step 6_2
   row;
   Readln;
   MakeAllFalse(M);                           //step 7
   SortNumbers(M);                            //step 8
   Output(M);                                 //step 9
   row;
   Readln;
   Writeln('Enter value');
   Readln(e);
   BinSearchNum(M,e);                         //step 10
   row;
   Readln;
   Output(M);                                 //step 11_1
   row;
   Readln;
    if NumbOfTrue(M)=1 then Writeln (NumbOfTrue(M),' true element')
   else Writeln(NumbOfTrue(M),' true elements');   //step 11_2
   Readln;

END.
