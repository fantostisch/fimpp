import stasiak.karol.fimpp.Main

object TestMain {
  def main(args: Array[String]) {
    val testPath = "./examples"
    val tests = List(
      "99bottles",
      "hello",
      "eratosthenes",
      "gcd",
      "bf",
      "swing"
    )
    tests.foreach(test => Main.main(Array(s"$testPath/$test.fimpp")))
  }
}
