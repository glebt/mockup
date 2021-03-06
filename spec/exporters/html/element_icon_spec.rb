#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

require "#{File.dirname(__FILE__)}/../testing_file_support"

describe BalsamiqControlParser do
  it "properly handles icon" do
    data = <<-EOF
            <mockup version="1.0" skin="sketch">
      <controls>
        <control controlID="6" controlTypeID="com.balsamiq.mockups::Icon" x="37" y="12" w="-1" h="-1" zOrder="0" locked="false" isInGroup="-1"/>
        <control controlID="7" controlTypeID="com.balsamiq.mockups::Icon" x="180" y="12" w="-1" h="-1" zOrder="1" locked="false" isInGroup="-1">
          <controlProperties>
            <color>16711680</color>
          </controlProperties>
        </control>
      </controls>
    </mockup>


    EOF
    html = <<-EOF
    <?xml version="1.0" encoding="UTF-8"?>
<!-- Generated by Balsamiq Exporter -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="reset.css" />
    <title>Balsamiq</title>
    <script type="text/javascript">
    </script>
  </head>

  <body>
    <div class="Icon" id="Icon6"
        style="position: absolute; font-size:10pt; outline: 2px solid rgba(1,1,1,1.0); text-align: left; left: 37px; top: 12px; width: 48px; height: 48px; z-index: 0">
    </div>
    <div class="Icon" id="Icon7"
        style="position: absolute; font-size:10pt; outline: 2px solid rgba(255,0,0,1.0); text-align: left; left: 180px; top: 12px; width: 48px; height: 48px; z-index: 1">
    </div>
  </body>
</html>

    EOF
    css = <<-EOF

    EOF
    js = <<-EOF

    EOF
    filename = "icon"
    TestingFileSupport::test_elements(filename, data, html, css, js, false)
  end

end
