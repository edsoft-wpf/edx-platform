.. _Setting Up A/B Tests:

###############################
Setting Up A/B Tests
###############################

This chapter describes how you can use A/B tests in your course. See:

* :ref:`Overview of A/B Tests`
* :ref:`The Course Staff View of A/B Tests`
* :ref:`The Studio Outline View of A/B Tests`
* :ref:`Configure the A/B Test in XML`

.. _Overview of A/B Tests:

***********************************
Overview of A/B Tests
***********************************

You can set up A/B tests to provide different course content to different groups of students. 

Within a unit, you can specify that a component is part of an A/B test and will be shown to one group of students and not the other.

Students are randomly assigned to content groups. You can then research and compare the performance of students in those groups to gain more insight into the relative effectiveness of your course content.

.. note:: In the current release, you must configure A/B tests through XML, then import the XML course into edX Studio. You can view A/B tests in Studio, but you cannot create or edit the content of A/B tests directly. See :ref:`Import a Course` for instructions.


.. _The Course Staff View of A/B Tests:

***********************************
The Course Staff View of A/B Tests
***********************************

When you view a unit that contains an A/B test in the LMS in the Staff view, you use a drop-down list to select a group. The unit page then shows the content for that group of students.

For example, in the following page, Group 0 is selected, and the video component that is configured to show for Group 0 is shown:

.. image:: Images/a-b-test-lms-group-0.png
 :alt: Image of a unit page with Group 0 selected

You can change the group selection to see the different video that a different group of students sees:

.. image:: Images/a-b-test-lms-group-2.png
 :alt: Image of a unit page with Group 2 selected

 .. note:: The example course content in this chapter use A/B test terminology to make the functionality clear. Typically, you do not want to use terminology in course content that would make students aware of the experiment.

.. _The Studio Outline View of A/B Tests:

********************************************
The Studio Outline View of A/B Tests
********************************************

After you configure an A/B test in XML and import the course into Studio, you can view the A/B test in the course outline.

The A/B test is displayed in a unit page as a component that contains other components. See :ref:`Nested Components` for more information.

The A/B test as a whole is the parent component.

For example, the following unit page contains just one component, which is the A/B test. No other content is shown on the unit page.

.. image:: Images/a-b-test-studio_unit_page.png
 :alt: Image of a unit page in Studio and an A/B test component

You see the A/B test's child components by clicking the arrow in the link above.  A read-only page then shows all the components in the A/B test:

.. image:: Images/a_b_test_children.png
 :alt: Image of the A/B test child components

Click the arrow next to a test component name to expand that test to see its contents. In this example, Group A contains an HTML component and a video:

.. image:: Images/a_b_test_child_expanded.png
 :alt: Image of an expanded A/B test component

.. _Configure the A/B Test in XML:

******************************
Configure the A/B Test in XML
******************************

You work with multiple XML files to configure an A/B test in your course. This section continues the example above and steps through the files involved in the A/B test that shows different videos to different groups of students.

For information about XML courses, see the `edX XML Tutorial <http://edx.readthedocs.org/projects/devdata/en/latest/course_data_formats/course_xml.html>`_.

++++++++++++++++++++++++++++++++++++++++++++++
Define the A/B Test in the Sequential File
++++++++++++++++++++++++++++++++++++++++++++++

You reference an A/B test in the file for the subsection in the ``sequential`` directory. For example:

.. code-block:: xml

 .....
 <vertical url_name="name for the unit that contains the A/B test">
  <split_test url_name="name of A/B test file"/>
 </vertical>
 .....


++++++++++++++++++++++++++++++++++++++++++++++++++++++
Define the A/B Test Content in the Split Test File
++++++++++++++++++++++++++++++++++++++++++++++++++++++

After you define the A/B test in the sequential file, you define the course content you want to test in the file in the ``split_test`` directory. This is the file referenced in the ``<split_test>`` element in the sequential file, as shown above.

In this file, you add elements for the A/B test content. For this example, you add two elements to compare the two different video files.

.. code-block:: xml

 <split_test url_name="name of the A/B test" user_partition_id="0" 
          group_id_to_child='{"0": "path to the video file for group 0", 
          "2": "path to the video file for group 2"}'>
    <video url_name="name of the video file from group 0"/>
    <video url_name="name of the video file from group 2"/>
  </video>
 </split_test>

