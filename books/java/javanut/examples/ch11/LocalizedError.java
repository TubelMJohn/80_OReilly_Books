// This example is from the book "Java in a Nutshell, Second Edition".
// Written by David Flanagan.  Copyright (c) 1997 O'Reilly & Associates.
// You may distribute this source code for non-commercial purposes only.
// You may study, modify, and use this example for any purpose, as long as
// this notice is retained.  Note that this example is provided "as is",
// WITHOUT WARRANTY of any kind either expressed or implied.

import java.text.*;
import java.io.*;
import java.util.*;

/**
 * A convenience class that can display a localized exception message
 * depending on the class of the exception.  It uses a MessageFormat,
 * and passes five arguments that the localized message may include:
 *   {0}: the message included in the exception or error.
 *   {1}: the full class name of the exception or error.
 *   {2}: a guess at what file the exception was caused by.
 *   {3}: a line number in that file.
 *   {4}: the current date and time.
 * Messages are looked up in a ResourceBundle with the basename
 * "Errors", using a the full class name of the exception object as
 * the resource name.  If no resource is found for a given exception
 * class, the superclasses are checked.
 */
public class LocalizedError {
  public static void display(Throwable error) {
    ResourceBundle bundle;
    // Try to get the resource bundle.
    // If none, print the error in a non-localized way.
    try { bundle = ResourceBundle.getBundle("Errors"); }
    catch (MissingResourceException e) {
      error.printStackTrace(System.err);
      return;
    }

    // Look up a localized message resource in that bundle, using the
    // classname of the error (or its superclasses) as the resource name.
    // If no resource was found, display the error without localization.
    String message = null;
    Class c = error.getClass();
    while((message == null) && (c != Object.class)) {
      try { message = bundle.getString(c.getName()); }
      catch (MissingResourceException e) { c = c.getSuperclass(); }
    }
    if (message == null) { error.printStackTrace(System.err);  return; }

    // Try to figure out the filename and line number of the
    // exception.  Output the error's stack trace into a string, and
    // use the heuristic that the first line number that appears in
    // the stack trace is after the first or  second colon.  We assume that
    // this stack frame is the first one the programmer has any control
    // over, and so report it as the location of the exception.
    String filename = "";
    int linenum = 0;
    try {
      StringWriter sw = new StringWriter();    // Output stream into a string.
      PrintWriter out = new PrintWriter(sw);   // PrintWriter wrapper.
      error.printStackTrace(out);              // Print stacktrace.
      String trace = sw.toString();            // Get it as a string.
      int pos = trace.indexOf(':');            // Look for first colon.
      if (error.getMessage() != null)          // If the error has a message
        pos = trace.indexOf(':', pos+1);       // look for second colon.
      int pos2 = trace.indexOf(')', pos);      // Look for end of line number.
      linenum = Integer.parseInt(trace.substring(pos+1,pos2));  // Get linenum.
      pos2 = trace.lastIndexOf('(', pos);      // Back to start of filename.
      filename = trace.substring(pos2+1, pos); // Get filename.
    }
    catch (Exception e) { ; }                  // Ignore exceptions.

    // Set up an array of arguments to use with the message
    String errmsg = error.getMessage();
    Object[] args = {
      ((errmsg!= null)?errmsg:""), error.getClass().getName(),
      filename, new Integer(linenum), new Date()
    };
    // Finally, display the localized error message, using
    // MessageFormat.format() to substitute the arguments into the message.
    System.out.println(MessageFormat.format(message, args));
  }
}
