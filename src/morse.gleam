import gleam/io
import gleam/dict
import gleam/pair
import gleam/list

pub fn main() {
  io.println("Hello from morse!")
}

const morse_dictionary_list = [
  #(".-", "A"),
  #("-...", "B"),
  #("-.-.", "C"),
  #("-..", "D"),
  #(".", "E"),
  #("..-.", "F"),
  #("--.", "G"),
  #("....", "H"),
  #("..", "I"),
  #(".---", "J"),
  #("-.-", "K"),
  #(".-..", "L"),
  #("--", "M"),
  #("-.", "N"),
  #("---", "O"),
  #(".--.", "P"),
  #("--.-", "Q"),
  #(".-.", "R"),
  #("...", "S"),
  #("-", "T"),
  #("..-", "U"),
  #("...-", "V"),
  #(".--", "W"),
  #("-..-", "X"),
  #("-.--", "Y"),
  #("--..", "Z"),
  #("-----", "0"),
  #(".----", "1"),
  #("..---", "2"),
  #("...--", "3"),
  #("....-", "4"),
  #(".....", "5"),
  #("-....", "6"),
  #("--...", "7"),
  #("---..", "8"),
  #("----.", "9"),
]

pub fn decode_letter(morse string: String) -> Result(String, Nil) {
  morse_dictionary_list
  |> dict.from_list
  |> dict.get(string)
}

pub fn encode_letter(morse string: String) -> Result(String, Nil) {
  morse_dictionary_list
  |> list.map(fn(x) { pair.swap(x) })
  |> dict.from_list
  |> dict.get(string)
}
