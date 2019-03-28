ThisBuild / scalaVersion := "2.12.8"
//ThisBuild / scalacOptions := Seq("-unchecked", "-deprecation", "-feature", "-Xfatal-warnings")

lazy val fimpp = (project in file("."))
  .settings(
    name := "fimpp",
    libraryDependencies ++= Seq(
      "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.1",
    )
  )
