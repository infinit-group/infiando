package infiando.util

/**
 * 
 */
class StringHelper {

    public static String removeNonWordCharacters(String toBeNormalized) {

        toBeNormalized = escapeCharacters(toBeNormalized.toLowerCase()).replaceAll("[\\W]", '')
        return toBeNormalized
    }


    public static String escapeCharacters(String toBeNormalized) {
        Properties p = new Properties() // see http://www.rgagnon.com/javadetails/java-0522.html
        p.load(new ByteArrayInputStream(("x=" + toBeNormalized).getBytes()))
        return p.getProperty("x")
    }
}
