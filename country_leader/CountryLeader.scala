// https://code.google.com/codejam/contest/11274486/dashboard#s=p0

object CountryLeader {
  def main(args: Array[String]) {
    val numTests = readLine().toInt
    for (test <- 1 to numTests) {
      val n = readLine().toInt
      val names = readNames(n)
      val sortedNames = names.sortBy(
        (name) => (-1 * name.replaceAll(" ", "").split("").distinct.length, name)
      )
      val leader = sortedNames(0)
      println("Case #" + test.toString + ": " + leader)
    }
  }

  def readNames(n: Int): List[String] = {
    if (n <= 0) {
      List()
    }
    else {
      readLine() :: readNames(n - 1)
    }
  }

}
