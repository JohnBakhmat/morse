import gleam/io
import gleam/dict
import gleam/pair
import gleam/list
import gleam/string
import gleam/result

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

pub fn decode_letter(morse in: String) -> Result(String, Nil) {
  morse_dictionary_list
  |> dict.from_list
  |> dict.get(string.trim(in))
}

pub fn encode_letter(latin in: String) -> Result(String, Nil) {
  morse_dictionary_list
  |> list.map(fn(x) { pair.swap(x) })
  |> dict.from_list
  |> dict.get(string.trim(in))
}

pub fn decode_word(
  morse input: String,
  separator sp: String,
) -> Result(String, Nil) {
  input
  |> string.trim()
  |> string.split(sp)
  |> list.filter(fn(x) { string.length(x) > 0 })
  |> list.map(fn(x) {
    x
    |> decode_letter
  })
  |> result.all()
  |> result.map(fn(x) { string.join(x, "") })
}

pub fn encode_word(
  latin input: String,
  separator sp: String,
) -> Result(String, Nil) {
  input
  |> string.trim()
  |> string.split("")
  |> list.map(fn(x) {
    x
    |> encode_letter
  })
  |> result.all()
  |> result.map(fn(x) { string.join(x, sp) })
}

pub fn decode_string(
  morse input: String,
  word_separator ws: String,
  letter_separator ls: String,
) -> Result(String, Nil) {
  input
  |> string.split(ws)
  |> list.map(fn(word) {
    word
    |> string.trim
    |> decode_word(ls)
  })
  |> result.all()
  |> result.map(fn(word) { string.join(word, " ") })
}

pub fn encode_string(
  latin input: String,
  word_separator ws: String,
  letter_separator ls: String,
) -> Result(String, Nil) {
  input
  |> string.trim()
  |> string.split(ws)
  |> list.map(fn(word) {
    word
    |> encode_word(ls)
  })
  |> result.all()
  |> result.map(fn(word) { string.join(word, ws) })
}
