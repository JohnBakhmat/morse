import gleeunit
import gleeunit/should
import gleam/dict
import morse.{decode_letter, encode_letter}

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn decode_letter_test() {
  let expected = dict.from_list([#("...", "S"), #("---", "O"), #("..---", "2")])

  expected
  |> dict.map_values(fn(input, expected) {
    input
    |> decode_letter
    |> should.be_ok
    |> should.equal(expected)
  })

  decode_letter("2")
  |> should.be_error

  decode_letter("...-.-.-.-")
  |> should.be_error
}

pub fn encode_letter_test() {
  let expected = dict.from_list([#("...", "S"), #("---", "O"), #("..---", "2")])

  expected
  |> dict.map_values(fn(expected, input) {
    input
    |> encode_letter
    |> should.be_ok
    |> should.equal(expected)
  })

  decode_letter("...-.-.-.-")
  |> should.be_error
}
