#!/bin/bash

# generate html image carousel pages for an arbitrary number of images
# in a linked image gallery.

echo "<!DOCTYPE html>
<html>
<head>
  <meta charset = \"UTF-8\">
  <link rel=\"stylesheet\" href=\"css/style.css\">
  <link rel=\"stylesheet\" href=\"css/header.css\">
  <link rel=\"stylesheet\" href=\"css/gallery.css\">
  <script src=\"components/header_gallery.js\" type=\"text/javascript\" defer></script>
  <script src=\"components/footer.js\" type=\"text/javascript\" defer></script>
  <script src=\"components/slider.js\" type=\"text/javascript\" defer></script>
  <title>Projects > x > x</title>
</head>

<body>
  <div id=\"container\">

    <header-component></header-component>

    <main>
      <!-- Container for the image gallery -->
      <div class=\"carousel\">

        <!-- Thumbnail images -->
        <div class=\"row\">"

i=1
for image_file_name in `ls images/${1}/${2}/*thumb.jpg`; do
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

i=1
for image_file_name in `ls images/${1}/${2}/*med.jpg`; do
    length=`ls images/${1}/${2}/*med.jpg | wc -l | sed -e 's/ //g'`;
    echo "        <div class=\"mySlides\">
            <div class=\"numbertext\">${i} / ${length}</div>
            <img src=\"${image_file_name}\"
                 style=\"width:100%\">
        </div>
";
    i=$(($i+1));
done;

echo "      </div> <!-- End Carousel -->
    </main>

    <footer-component></footer-component>

  </div> <!-- End Container -->
</body>
</html>
"
