package stasiak.karol.fimpp

import util.parsing.input.Position

/**
 * Created with IntelliJ IDEA.
 * User: karol
 * Date: 06.10.12
 * Time: 14:56
 * To change this template use File | Settings | File Templates.
 */
object FimException {

}

class FimException(msg:String, pos:Position=null) extends Exception(msg)
{
  override def toString: String = {
    pos match {
      case null => "error: " + msg
      case _  => "[" + pos + "] error: " + msg + "\n\n" + pos.longString
    }
  }
}
