program DelphiInputOutputUTF8;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

VAR
  NumCharsWritten: DWORD;
  NumCharsRead: DWORD;
  Text: String; // Строка UTF-8
  i: integer;

begin
  try
    SetLength(Text, 255); // Устанавливаем максимальное количество символов для переменной
    // Вводим строку в UTF-8 через вызов функции WinAPI ReadConsoleW
    ReadConsole(GetStdHandle(STD_INPUT_HANDLE), PChar(Text), Length(Text), NumCharsRead, nil);
    SetLength(Text, NumCharsRead - 2); // Убираем с ввода символы новой строки (нажатие на Enter)
    // Распечатаем символы на экран
    for i := 1 to Length(Text) do begin
      Writeln('[', i, '] char: ', Text[i], ', code: ', ord(Text[i]));
    end;
    // Меняем текст UTF-8 (добавляем в конец)
    Text := Text + ' -> Замечательно! Das ist großartig! Wonderful! 精彩的！ رائع!';
    // Выводим строку в UTF-8 через вызов функции WinAPI WriteConsoleW
    WriteConsole(GetStdHandle(STD_OUTPUT_HANDLE), PChar(Text), Length(Text), NumCharsWritten, nil);


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn; // Ожидание нажатия на Enter

end.
