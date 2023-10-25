# Regular Expression

| Option | Description |
| - | - |
| . | The period (.) matches any single character. |
| ? | The preceding item is optional and will be matched at most once. |
| * | The preceding item will be matched zero or more times. |
| + | The preceding item will be matched one or more times. |
| {n} | The preceding item is matched exactly n times. |
| {n,} | The preceding item is matched n or more times. |
| {,m} | The preceding item is matched at most m times. |
| {n,m} | The preceding item is matched at least n times, but not more than m times. |
| [:alnum:] | Alphanumeric characters: '[:alpha:]' and '[:digit:]'; in the 'C' locale and ASCII character encoding, this is the same as '[0-9A-Za-z]'. |
| [:alpha:] | Alphabetic characters: '[:lower:]' and '[:upper:]'; in the 'C' locale and ASCII character encoding, this is the same as '[A-Za-z]'. |
| [:blank:] | Blank characters: space and tab. |
| [:cntrl:] | Control characters. In ASCII, these characters have octal codes 000 through 037, and 177 (DEL). In other character sets, these are the equivalent characters, if any. |
| [:digit:] | Digits: 0 1 2 3 4 5 6 7 8 9. |
| [:graph:] | Graphical characters: '[:alnum:]' and '[:punct:]'. |
| [:lower:] | Lower-case letters; in the 'C' locale and ASCII character encoding, this is a b c d e f g h i j k l m n o p q r s t u v w x y z. |
| [:print:] | Printable characters: '[:alnum:]', '[:punct:]', and space. |
| [:punct:] | Punctuation characters; in the 'C' locale and ASCII character encoding, this is! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ' { | } ~. In other character sets, these are the equivalent characters, if any. |
| [:space:] | Space characters: in the 'C' locale, this is tab, newline, vertical tab, form feed,carriage return, and space. |
| [:upper:] | Upper-case letters: in the 'C' locale and ASCII character encoding, this is A B C D E F G H I J K L M N O P Q R S T U V W X Y Z. |
| [:xdigit:] |  Hexadecimal digits: 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f. |
| \b |  Match the empty string at the edge of a word. |
| \B |  Match the empty string provided it is not at the edge of a word. |
| \< |  Match the empty string at the beginning of word. |
| \> |  Match the empty string at the end of word. |
| \w |  Match word constituent. Synonym for '[\_[:alnum:]]'. |
| \W |  Match non-word constituent. Synonym for '[\^\_[:alnum:]]'. |
| \s |  Match white space. Synonym for '[[:space:]]'. |
| \S |  Match non-whitespace. Synonym for '[^[:space:]]'. |
