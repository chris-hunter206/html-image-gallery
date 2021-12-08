#!/bin/bash

# Generate html image carousel pages for an arbitrary number of jpeg
# images in an a subfolder named 'images' of the current directory

# 
echo "<!DOCTYPE html>
<html>
<head>
  <meta charset = \"UTF-8\">
  <link rel=\"stylesheet\" href=\"css/gallery.css\">
  <script src=\"components/slider.js\" type=\"text/javascript\" defer></script>
  <title>Projects > x > x</title>
</head>

<body>
  <div id=\"container\">

    <main>
      <!-- Container for the image gallery -->
      <div class=\"carousel\">

        <!-- Thumbnail images -->
        <div class=\"row\">"

# create the image thumbnail stanzas
i=1
for image_file_name in `ls images/*thumb.jpg`; do
    echo "
          <div class=\"column\">
              <img class=\"demo cursor\"
                   src=\"${image_file_name}\"
                   style=\"width:100%\"
                   onclick=\"currentSlide($i)\"
                   alt=\"\">
          </div>";
    i=$(($i+1));
done;

echo "
        </div> <!-- End Row -->

        <!-- Next and previous buttons -->
        <a class=\"prev\" onclick=\"plusSlides(-1)\">&#10094;</a>
        <a class=\"next\" onclick=\"plusSlides(1)\">&#10095;</a>

        <!-- Image text -->
        <div class=\"caption-container\">
            <p id=\"caption\"></p>
        </div>

        <!-- Full-width images with number text -->"

# Create the full size image stanzas. This also gets the number of 
# images to produce the correct numbering (1 / 2, etc) for each
# image in the gallery
i=1
for image_file_name in `ls images/*med.jpg`; do
    length=`ls images/*med.jpg | wc -l | sed -e 's/ //g'`;
    echo "        <div class=\"mySlides\">
            <div class=\"numbertext\">${i} / ${length}</div>
            <img src=\"${image_file_name}\"
                 style=\"width:100%\">
        </div>
";
    i=$(($i+1));
done;

# print the static html to close out the page
echo "      </div> <!-- End Carousel -->
    </main>

  </div> <!-- End Container -->
</body>
</html>
"
