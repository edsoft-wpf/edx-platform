
.. _Appendix E:


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
APPENDIX E: Problem and Tool XML
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This appendix provides information about the XML tags for most problem and tool types in Studio:

* :ref:`General`
* :ref:`Choice Response`
* :ref:`Chemical Equation Input`
* :ref:`Custom Response`
* :ref:`Drag and Drop XML`
* :ref:`Formula Response`
* :ref:`Image Response`
* :ref:`Multiple Choice Response`
* :ref:`Numerical Response`
* :ref:`Option Response`
* :ref:`Schematic Response`
* :ref:`String Response`


.. _General:

=======
General
=======
 
Most problems have the following tags.

.. list-table::
   :widths: 20 80

   * - ``<problem> </problem>``
     - These must be the first and last tags for any content created in the Advanced Editor in a Problem component.
   * - ``<startouttext/>``
     - The ``<startouttext />`` tag indicates the beginning of a line or block of text.
   * - ``<endouttext/>``
     - The ``<endouttext />`` tag indicates the end of a line or block of text.
   * - ``<solution> <div class="detailed-solution"> </div> </solution>`` (optional)
     - If you want to include more information in the problem, such as a detailed explanation of the problem's answer, you'll enter the text between the two ``<div>`` tags, which are inside the ``<solution>`` tags. (These tags do not have to be on the same line.)

Additionally, all problems must include a **label** attribute. This attribute adds a descriptive label that helps visually impaired students navigate through the problem.

You'll add a **label** attribute to one of the XML tags for the problem. Each example problem below includes a label.

.. _Checkbox Problem XML:

=============================
Checkbox Problem XML 
=============================

Template
--------

.. code-block:: xml

  <problem>
  <startouttext/>
    <p>Question text</p>

  <choiceresponse>

  <checkboxgroup direction="vertical" label="label text">
  <choice correct="false"><text>Answer option 1 (incorrect)</text></choice>
  <choice correct="true"><text>Answer option 2 (correct)</text></choice>
  </checkboxgroup>

   <solution>
   <div class="detailed-solution">
   <p>Solution or Explanation Heading</p>
   <p>Solution or explanation text</p>
   </div>
   </solution>

  </choiceresponse>
  </problem>

Tags
----

* ``<choiceresponse>`` (required): Specifies that the problem contains options for students to choose from.
* ``<checkboxgroup>`` (required): Specifies that the problem is a checkbox problem.
* ``<choice>`` (required): Designates an answer option.

**Tag:** ``<choiceresponse>``

Specifies that the problem contains options for students to choose from.

  Children

  * - ``<checkboxgroup>``

**Tag:** ``<checkboxgroup>``

Specifies that the problem is a checkbox problem.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - direction (optional)
       - Specifies the orientation of the list of answers. The default is vertical.
     * - label (required)
       - Specifies the name of the response field.

  Children

  * - ``<choice>`` 

**Tag:** ``<choice>``

Designates an answer option.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - true (at least one required)
       - Indicates a correct answer. For checkbox problems, one or more ``<choice>`` tags can contain a correct answer.
     * - false (at least one required)
       - Indicates an incorrect answer.


.. _Chemical Equation Problem XML:

=============================
Chemical Equation Problem XML
=============================

Template
--------

.. code-block:: xml

  <problem>
    <startouttext/>
    <p>Problem text</p>

    <customresponse>
      <chemicalequationinput size="NUMBER" label="LABEL TEXT"/>
      <answer type="loncapa/python">

  if chemcalc.chemical_equations_equal(submission[0], 'TEXT REPRESENTING CHEMICAL EQUATION'):
      correct = ['correct']
  else:
      correct = ['incorrect']

      </answer>
    </customresponse>

    <endouttext/>
  
   <solution>
   <div class="detailed-solution">
   <p>Solution or Explanation Header</p>
   <p>Solution or explanation text</p>
   </div>
   </solution>
  </problem>

Tags
----

.. list-table::
   :widths: 20 80

   * - ``<customresponse>``
     - Indicates that this problem has a custom response. 
   * - ``<chemicalequationinput>``
     - A child of ``<customresponse>``. Indicates that the answer to this problem is a chemical equation. Must contain the ``size`` and ``label`` attributes.
   * - ``<answer type=loncapa/python>``
     - A child of ``<chemicalequationinput>``. Contains the Python script that grades the problem.

**Tag:** ``<customresponse>``

Indicates that this problem has a custom response. The ``<customresponse>`` tags must surround the ``<chemicalequation>`` tags.

  Children

  * ``<chemicalequationinput>``
  * ``<answer>``

**Tag:** ``<chemicalequationinput>``

Indicates that the answer to this problem is a chemical equation and creates a response field where the student enters an answer.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - size 
       - Specifies the size of the response field, in characters.
     * - label (required)
       - Contains the text of the principal question in the problem.

**Tag:** ``<answer>``

Contains the Python script that grades the problem.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - type (required) 
       - Must be "loncapa/python".
     

.. _Drag and Drop Problem XML:

=========================
Drag and Drop Problem XML
=========================

Template
--------

.. code-block:: xml

  <problem>
    <p>Problem text</p>
    <customresponse>
      <drag_and_drop_input no_labels="false" one_per_target="true" target_outline="true" img="/static/TARGET_IMAGE.gif">
        <draggable can_reuse="true" label="NAME 1" id="1"/>
        <draggable can_reuse="true" label="NAME 2" id="2"/>
        <target id="0" h="HEIGHT (in pixels)" w="WIDTH (in pixels)" y="Y-COORDINATE" x="X-COORDINATE"/>
        <target id="1" h="HEIGHT (in pixels)" w="WIDTH (in pixels)" y="Y-COORDINATE" x="X-COORDINATE"/>
      </drag_and_drop_input>
      <answer type="loncapa/python"> correct_answer = [ {'draggables': ['2'], 'targets': ['0' ], 'rule':'unordered_equal' }, {'draggables': ['none'], 'targets': ['1' ], 'rule':'unordered_equal' }] if draganddrop.grade(submission[0], correct_answer): correct = ['correct'] else: correct = ['incorrect'] </answer>
    </customresponse>
    <solution>
      <img src="/static/ANSWER_IMAGE.gif"/>
    </solution>
  </problem>

Tags
----

* ``<drag_and_drop_input/>``: Indicates the problem is a drag and drop problem.
* ``<draggable/>``: Specifies a single draggable object.
* ``<target>``: Specifies the place on the base image where a draggable can be positioned.

**Tag:** ``<drag_and_drop_input/>``

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - img (required)
       - Relative path to an image that will be the base image. All draggables can be dragged onto it.
     * - target_outline 
       - Specifies whether an outline (gray dashed line) should be drawn around targets (if they are specified). It can be either 'true' or 'false'. If not specified, the targets do not have outlines.
     * - one_per_target 
       - Specify whether to allow more than one draggable to be placed onto a single target. It can be either 'true' or 'false'. If not specified, the default value is 'true'.
     * - no_labels (required)
       - default is false, in default behaviour if label is not set, label is obtained from id. If no_labels is true, labels are not automatically populated from id, and one can not set labels and obtain only icons.

  Children

  .. list-table::
     :widths: 20 80

     * - Children
     * - ``<draggable>``
     * - ``<target>``

**Tag:** ``<draggable/>``

Specifies a single draggable object in a drag and drop problem.

A draggable is what the user must drag out of the slider and place onto the base image. After a drag operation, if the center of the draggable ends up outside the rectangular dimensions of the image, it will be returned back to the slider.

For the grader to work, each draggable must have a unique ID. Label and icon attributes are optional. If they are provided they will be used, otherwise, you can have an empty draggable. The path is relative to 'course_folder' folder, for example, /static/images/img1.png.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - id (required)
       - Unique identifier of the draggable object.
     * - label (optional)
       - Text label that the user sees.
     * - icon (optional)
       - For draggables that are images, the relative path to the image file.
     * - can_reuse
       - true or false, default is false. If true, same draggable can be used multiple times.

**Tag:** ``<target>``

Specifies a place on the base image where a draggable can be positioned. By design, if the center of a draggable lies within the target (i.e. in the rectangle defined by [[x, y], [x + w, y + h]], then it is within the target. Otherwise, it is outside.

If at least one target is provided, the behavior of the client side logic changes. If a draggable is not dragged on to a target, it is returned to the slider.

If no targets are provided, then a draggable can be dragged and placed anywhere on the base image.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - id (required)
       - Unique identifier of the target object.
     * - x
       - X-coordinate on the base image where the top left corner of the target will be positioned.
     * - y
       - Y-coordinate on the base image where the top left corner of the target will be positioned.
     * - w
       - Width of the target, in pixels.
     * - h
       - Height of the target, in pixels.

For more information about how to create drag and drop problems, see `XML Format of Drag and Drop Input
<https://edx.readthedocs.org/en/latest/course_data_formats/drag_and_drop/drag_and_drop_input.html>`_.


.. _Dropdown Problem XML:

==========================
Dropdown Problem XML
==========================

Template
--------

.. code-block:: xml

  <problem>
  <p>
    Problem text</p>
  <optionresponse>
    <optioninput options="('Option 1','Option 2','Option 3')" correct="Option 2" label="label text"/>
  </optionresponse>
    <solution>
      <div class="detailed-solution">
      <p>Explanation or Solution Header</p>
      <p>Explanation or solution text</p>
      </div>
    </solution>
  </problem>

.. code-block:: xml

  <problem>
   <p>Problem text</p>
    <optionresponse>
     options="('A','B')"
      correct="A"/>
      label="label text"
    </optionresponse>
   
    <solution>
      <div class="detailed-solution">
      <p>Explanation or Solution Header</p>
      <p>Explanation or solution text</p>
      </div>
    </solution>
  </problem>

Tags
----

* ``<optionresponse>`` (required)
* ``<optioninput>`` (required)

**Tag:** ``<optionresponse>``

Indicates that the problem is a dropdown problem.

  Children

  .. list-table::
     :widths: 20 80

     * - Children
       - Description
     * - ``<optioninput>``
       - Lists the answer options. 

**Tag:** ``<optioninput>``

Lists the answer options.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - options (required)
       - Lists the answer options. The list of all answer options is surrounded by parentheses. Individual answer options are surrounded by single quotation marks (') and separated by commas (,).
     * - correct (required)
       - Indicates whether an answer is correct. Possible values are "true" and "false". Only one **correct** attribute can be set to "true".
     * - label (required)
       - Specifies the name of the response field.


.. _Image Mapped Input Problem XML:

==============================
Image Mapped Input Problem XML 
==============================

Template
--------

.. code-block:: xml

  <problem>
    <startouttext/>
      <p>In the image below, click the triangle.</p>
    <endouttext/>
        <imageresponse>
         <imageinput src="IMAGE FILE PATH" width="NUMBER" height="NUMBER" rectangle="(X-AXIS,Y-AXIS)-(X-AXIS,Y-AXIS)" />
        </imageresponse>
  </problem>

Tags
====

* ``<imageresponse>``: Indicates that the problem is an image mapped input problem.
* ``<imageinput>``: Specifies the image file and the region in the file that the student must click. This tag includes the ``src``, ``width``, ``height``, and ``rectangle`` attributes.

**Tag:** ``<imageresponse>``

Children

  .. list-table::
     :widths: 20 80

     * - Child
     * - ``<imageinput>``

**Tag:** ``<imageinput>``

Attributes

 .. list-table::
    :widths: 20 80

    * - Attribute
      - Description
    * - src
      - The URL of the image
    * - height
      - The height of the image, in pixels
    * - width
      - The width of the image, in pixels
    * - rectangle
      - An attribute with four embedded values in the format (<start_width>,<start_height>)-(<end_width>,<end-height>). All coordinates start with (0,0) in the top left corner and increase in value toward the bottom right corner, very similar to the progression of reading English. The two coordinates defined form the two opposite corners of a box which a student can click inside of.



.. _JS Input Problem XML:

=============================
JavaScript Input Problem XML 
=============================

JSInput allows problem authors to turn stand-alone HTML files into problems that can be integrated into the edX platform. Since its aim is flexibility, it can be seen as the input and client-side equivalent of **CustomResponse**.

A JSInput exercise creates an IFrame in a static HTML page, and passes the return value of author-specified functions to the enclosing response type (generally **CustomResponse**). JSInput can also store and retrieve state.

Format
^^^^^^^

The following is the basic format of a JSInput problem:

.. code-block:: xml

 <problem>
        <script type="loncapa/python">
 def all_true(exp, ans): return ans == "hi"
        </script>
        <customresponse cfn="all_true">
            <jsinput gradefn="gradefn" 
                height="500"
                get_statefn="getstate"
                set_statefn="setstate"
                html_file="/static/jsinput.html"/>
        </customresponse>
 </problem>

The accepted attributes are:

==============  ==============  =========  ==========
Attribute Name   Value Type     Required   Default
==============  ==============  =========  ==========
html_file        Url string     Yes        None
gradefn          Function name  Yes        `gradefn`
set_statefn      Function name  No         None
get_statefn      Function name  No         None
height           Integer        No         `500`
width            Integer        No         `400`
==============  ==============  =========  ==========


Required Attributes
^^^^^^^^^^^^^^^^^^^^^

**html_file**

The **html_file** attribute specifies the HTML file that the IFrame will point to. The HTML file
must be located in the content directory.

The IFrame is created using the sandbox attribute. Although pop-ups, scripts, and pointer locks are allowed, the IFrame cannot access its parent's attributes.

The HTML file must contain a **gradefn** function that the JSInput file can access. To determine whether the **gradefn** function is accessible, in the console, make sure that **gradefn** returns the right thing. When JSInput uses the **gradefn** function, `gradefn` is called with `gradefn`.call(`obj`), where **obj** is the object-part of **gradefn**. For example, if **gradefn** is **myprog.myfn**, JSInput calls **myprog.myfun.call(myprog)**. (This is to ensure "`this`" continues to refer to what `gradefn` expects.)

Aside from that, more or less anything goes. Note that currently there is no support for inheriting CSS or JavaScript from the parent (aside from the Chrome-only **seamless** attribute, which is set to True by default).

**gradefn**

The `gradefn` attribute specifies the name of the function that will be called when a user clicks **Check**, and that returns the student's answer. Unless both the get_statefn and set_statefn attributes are also used, this answer is passed as a string to the enclosing response type. In the customresponse example above, this means cfn will be passed this answer as `ans`.

If the `gradefn` function throws an exception when a student attempts to submit a problem, the submission is aborted, and the student receives a generic alert. The alert can be customised by making the exception name `Waitfor Exception`; in that case, the alert message will be the exception message.

.. important:: To make sure the student's latest answer is passed correctly, make sure that the `gradefn` function is not asynchronous. Moreover, the function should also return promptly, since currently the student has no indication that her answer is being calculated or produced.

Optional Attributes
^^^^^^^^^^^^^^^^^^^^^

**set_statefn**

Sometimes a problem author will want information about a student's previous answers ("state") to be saved and reloaded. If the attribute `set_statefn` is used, the function given as its value will be passed the state as a string argument whenever there is a state, and the student returns to a problem. The function has the responsibility to then use this state approriately.

The state that is passed is:

* The previous output of `gradefn` (i.e., the previous answer) if `get_statefn` is not defined.
* The previous output of `get_statefn` (see below) otherwise.

It is the responsibility of the iframe to do proper verification of the argument that it receives via `set_statefn`.

**get_statefn**

Sometimes the state and the answer are quite different. For instance, a problem that involves using a javascript program that allows the student to alter a molecule may grade based on the molecule's hydrophobicity, but from the hydrophobicity it might be incapable of restoring the state. In that case, a
*separate* state may be stored and loaded by `set_statefn`. Note that if `get_statefn` is defined, the answer (i.e., what is passed to the enclosing response type) will be a json string with the following format:

.. code-block:: xml

    {
        answer: `[answer string]`
        state: `[state string]`
    }


The enclosing response type must then parse this as json.

**height** and **width**

The `height` and `width` attributes are straightforward: they specify the height and width of the IFrame. Both are limited by the enclosing DOM elements, so for instance there is an implicit max-width of around 900. 

In the future, JSInput may attempt to make these dimensions match the HTML file's dimensions (up to the aforementioned limits), but currently it defaults to `500` and `400` for `height` and `width`, respectively.



.. _Multiple Choice Problem XML:

=============================
Multiple Choice Problem XML 
=============================

Template
--------

.. code-block:: xml

  <problem>
  <p>Question text</p>
  <multiplechoiceresponse>
    <choicegroup type="MultipleChoice" label="label text">
      <choice correct="false" name="a">Incorrect choice</choice>
      <choice correct="true" name="b">Correct choice</choice>
    </choicegroup>
  </multiplechoiceresponse>

  <solution>
    <div class="detailed-solution">
    <p>Explanation or solution header</p>
    <p>Explanation or solution text</p>
    </div>
  </solution>
  </problem>

Tags
----

* - ``<multiplechoiceresponse>`` (required): Indicates that the problem is a multiple choice problem.
* - ``<choicegroup>`` (required): Indicates the beginning of the list of options. Contains the ``label`` attribute.
* - ``<choice>`` (required): Lists an option. This tag includes the ``correct`` and ``name`` attributes.

**Tag:** ``<multiplechoiceresponse>``

  Children

  .. list-table::
     :widths: 20 80

     * - Child
       - Description
     * - ``<choicegroup>``
       - Indicates the beginning of the list of options.
     * - All standard HTML tags
       - Can be used to format text.


**Tag:** ``<choicegroup>``

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - label (required)
       - Specifies the name of the response field.
     * - type (required)
       - Must be set to "MultipleChoice".

  Children

  .. list-table::
     :widths: 20 80

     * - Children
       - Description
     * - ``<choice>``
       - Designates an answer option. 

**Tag:** ``<choice>``

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - correct (at least one required)
       - Indicates a correct or incorrect answer. When the attribute is set to "true", the choice is a correct answer. When the attribute is set to "false", the choice is an incorrect answer. Only one choice can be a correct answer.
     * - name
       - A unique name that the back end uses to refer to the choice.

.. _Numerical Input Problem XML:

===========================
Numerical Input Problem XML
===========================

Templates
---------

The following templates represent problems with and without a numerical or percentage tolerance.

Answer with no tolerance
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: xml

  <p>TEXT OF PROBLEM
      <numericalresponse answer="ANSWER (NUMBER)">
          <formulaequationinput label="TEXT OF PROBLEM"/>
      </numericalresponse>
  </p>
   
    <solution>
    <div class="detailed-solution">
    <p>TEXT OF SOLUTION</p>
    </div>
  </solution>
  </problem>

Answer with a decimal tolerance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: xml

  <problem>
   
    <p>TEXT OF PROBLEM
    <numericalresponse answer="ANSWER (NUMBER)">
      <responseparam type="tolerance" default="NUMBER (DECIMAL, e.g., .02)" />
      <formulaequationinput label="TEXT OF PROBLEM"/>
    </numericalresponse>
  </p>
   
    <solution>
    <div class="detailed-solution">
    <p>TEXT OF SOLUTION</p>
    </div>
  </solution>
  </problem>

Answer with a percentage tolerance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: xml

  <problem>
   
   <p>TEXT OF PROBLEM
    <numericalresponse answer="ANSWER (NUMBER)">
      <responseparam type="tolerance" default="NUMBER (PERCENTAGE, e.g., 3%)" />
      <formulaequationinput label="TEXT OF PROBLEM"/>
    </numericalresponse>
   </p>

    <solution>
    <div class="detailed-solution">
    <p>TEXT OF SOLUTION</p>
    </div>
  </solution>
  </problem>

Answer created with a script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: xml

  <problem>

  <!-- Use python script spacing. The following should not be indented! -->
  <script type="loncapa/python">
  computed_response = math.sqrt(math.fsum([math.pow(math.pi,2), math.pow(math.e,2)]))
  </script>

  <p>TEXT OF PROBLEM
      <numericalresponse answer="$computed_response">
          <responseparam type="tolerance" default="0.0001" />
          <formulaequationinput label="TEXT OF PROBLEM"/>
      </numericalresponse>
  </p>

    <solution>
    <div class="detailed-solution">
     <p>TEXT OF SOLUTION</p>
    </div>
  </solution>
  </problem>


.. code-block:: xml

  <problem>
    <p>Problem text</p>
    <formularesponse type="ci" samples="VARIABLES@LOWER_BOUNDS:UPPER_BOUNDS#NUMBER_OF_SAMPLES" answer="$VoVi">
      <responseparam type="tolerance" default="0.00001"/>
      <formulaequationinput size="20"  label="Enter the equation"/>
    </formularesponse>

  <script type="loncapa/python">
  VoVi = "(R_1*R_2)/R_3"
  </script>

    <solution>
      <div class="detailed-solution">
        <p>Explanation or Solution Header</p>
        <p>Explanation or solution text</p>
      </div>
    </solution>
  </problem>


Tags
----

* ``<numericalresponse>`` (required): Specifies that the problem is a numerical input problem.
* ``<formulaequationinput>`` (required): Provides a response field where the student enters a response.
* ``<responseparam>`` (optional): Specifies a tolerance, or margin of error, for an answer.
* ``<script>`` (optional):

.. note:: Some older problems use the ``<textline math="1" />`` tag instead of the ``<formulaequationinput />`` tag. However, the ``<textline math="1" />`` has been deprecated. All new problems should use the ``<formulaequationinput />`` tag.

**Tag:** ``<numericalresponse>``

Specifies that the problem is a numerical input problem. The ``<numericalresponse>`` tag is similar to the ``<formularesponse>`` tag, but the ``<numericalresponse>`` tag does not allow unspecified variables.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - answer (required)
       - The correct answer to the problem, given as a mathematical expression. 

        .. note:: If you include a variable name preceded with a dollar sign ($) in the problem, you can include a script in the problem that computes the expression in terms of that variable.

        The grader evaluates the answer that you provide and the student's response in the same way. The grader also automatically simplifies any numeric expressions that you or a student provides. Answers can include simple expressions such as "0.3" and "42", or more complex expressions such as "1/3" and "sin(pi/5)". 

  Children

  .. list-table::
     :widths: 20 80

     * - Child
       - Description
     * - ``<responseparam>``
       - 
     * - ``<formulaequationinput>``
       - 

**Tag:** * ``<formulaequationinput>``

Creates a response field in the LMS where students enter a response.

  Attributes

  .. list-table::
     :widths: 20 80

     * - size (optional)
       - Defines the width, in characters, of the response field in the LMS.


**Tag:** ``<responseparam>``

Specifies a tolerance, or margin of error, for an answer.

  Attributes

  .. list-table::
     :widths: 20 80

     * - type (optional)
       - "tolerance": Defines a tolerance for a number
     * - default (optional)
       - A number or a percentage specifying a numerical or percent tolerance.

**Tag:** ``<script>``

Specifies a script that the grader uses to evaluate a student's response. A problem behaves as if all of the code in all of the script tags were in a single script tag. Specifically, any variables that are used in multiple ``<script>`` tags share a namespace and can be overriden.

As with all Python, indentation matters, even though the code is embedded in XML.

  Attributes

  .. list-table::
     :widths: 20 80

     * - type (required)
       - Must be set to "loncapa/python".


.. _Math Expression Input Problem XML:

==================================
Math Expression Input Problem XML
==================================

Templates
---------

.. code-block:: xml

  <problem>
    <p>Write an expression for the product of R_1, R_2, and the inverse of R_3.</p>
    <formularesponse type="ci" samples="R_1,R_2,R_3@1,2,3:3,4,5#10" answer="R_1*R_2/R_3">
      <responseparam type="tolerance" default="0.00001"/> 
      <formulaequationinput size="40" />
    </formularesponse>
  </problem>

Tags
----

* ``<formularesponse>``
* ``<formulaequationinput />``
* ``<responseparam>``
* ``<script>``

**Tag:** ``<formularesponse>``

Specifies that the problem is a math expression input problem. The ``<formularesponse>`` tag is similar to ``<numericalresponse>``, but ``<formularesponse>`` allows unknown variables.

  Attributes

  **type**: Can be "cs" (case sensitive, the default) or "ci" (case insensitive, so that capitalization doesn't matter in variable names).

  **answer**: The correct answer to the problem, given as a mathematical expression. If you precede a variable name in the problem with a dollar sign ($), you can include a script in the problem that computes the expression in terms of that variable.

  **samples**: Specifies important information about the problem in four lists:

    * **variables**: A set of variables that students can enter.
    * **lower_bounds**: For every defined variable, a lower bound on the numerical tests to use for that variable.
    * **upper_bounds**: For every defined variable, an upper bound on the numerical tests to use for that variable.
    * **num_samples**: The number of times to test the expression.

    Commas separate items inside each of the four individual lists, and the at sign (@), colon (:), and pound sign (#) characters separate the four lists. The format is the following:

    ``"variables@lower_bounds:upper_bounds#num_samples``

    For example, a ``<formularesponse>`` tag that includes the **samples** attribute may look like either of the following.

    ``<formularesponse samples="x,n@1,2:3,4#10">``

    ``<formularesponse samples="R_1,R_2,R_3@1,2,3:3,4,5#10">``

  Children

  .. list-table::
     :widths: 20

     * - Child
     * - ``<formulaequationinput />``

**Tag:** ``<formulaequationinput />``

Creates a response field where a student types an answer to the problem in plain text, as well as a second field below the response field where the student sees a typeset version of the plain text. The parser that renders the student's plain text into typeset math is the same parser that evaluates the student's response for grading.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - size (optional)
       - Specifies the width, in characters, of the response field where students enter answers.

**Tag:** ``<responseparam>``

Used to define an upper bound on the variance of the numerical methods used to approximate a test for equality.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - default (required)
       - A number or a percentage specifying how close the student and grader expressions must be. Failure to include a tolerance leaves expressions vulnerable to unavoidable rounding errors during sapling, causing some student input to be graded as incorrect, even if it is algebraically equivalent to the grader's expression.
     * - type
       - "tolerance"--defines a tolerance for a number

.. _Text Input Problem XML:

======================
Text Input Problem XML
======================

Template
--------

.. code-block:: xml

  <problem>
      <p>Problem text</p>
      <stringresponse answer="**.Correct answer 1.**" type="ci regexp">
          <additional_answer>Correct answer 2</additional_answer>
          <additional_answer>Correct answer 3</additional_answer>
          <textline size="20" label="label text"/>
          <hintgroup>
              <stringhint answer="Incorrect answer A" type="ci" name="hintA" />
                <hintpart on="hintA">
                    <startouttext />Text of hint for incorrect answer A<endouttext />
                </hintpart >
              <stringhint answer="Incorrect answer B" type="ci" name="hintB" />
                <hintpart on="hintB">
                    <startouttext />Text of hint for incorrect answer B<endouttext />
                </hintpart >
              <stringhint answer="Incorrect answer C" type="ci" name="hintC" />
                <hintpart on="hintC">
                    <startouttext />Text of hint for incorrect answer C<endouttext />
                </hintpart >
          </hintgroup>
      </stringresponse>
      <solution>
      <div class="detailed-solution">
      <p>Explanation or Solution Header</p>
      <p>Explanation or solution text</p>
      </div>
    </solution>
  </problem>

Tags
----

.. list-table::
   :widths: 20 80

   * - ``<stringresponse>``
     - Indicates that the problem is a text input problem. 
   * - ``<textline>``
     - Child of ``<stringresponse>``. Creates a response field in the LMS where the student enters a response.
   * - ``<additional_answer>`` (optional)
     - Specifies an additional correct answer for the problem. A problem can contain an unlimited number of additional answers.
   * - ``<hintgroup>`` (optional)
     - Indicates that the instructor has provided hints for certain common incorrect answers.
   * - ``<stringhint />`` (optional)
     - Child of ``<hintgroup>``. Specifies the text of the incorrect answer to provide the hint for. Contains answer, type, name.
   * - ``<hintpart>``
     - Contains the name from ``<stringhint>``. Associates the incorrect answer with the hint text for that incorrect answer.
   * - ``<startouttext />``
     - Indicates the beginning of the text of the hint.
   * - ``<endouttext />``
     - Indicates the end of the text of the hint.

**Tag:** ``<stringresponse>``

Indicates that the problem is a text input problem.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - answer (required)
       - Specifies the correct answer. To designate the answer as a regular expression, add "regexp" to the **type** attribute. If you do not add "regexp" to the **type** attribute, the student's answer must match the value in this attribute exactly.
     * - type (optional)
       - Can specify whether the problem is case sensitive and allows regular expressions. If the ``<stringresponse>`` tag includes ``type="ci"``, the problem is not case sensitive. If the tag includes ``type="cs"``, the problem is case sensitive. If the tag includes ``type="regexp"``, the problem allows regular expressions. A **type** attribute in a ``<stringresponse>`` tag can also combine these values. For example, ``<stringresponse type="regexp cs">`` specifies that the prolem allows regular expressions and is case sensitive.

  Children

  .. list-table::
     :widths: 20 80

     * - Child
       - Description
     * - ``<textline />`` (required)
       - 
     * - ``<additional_answer>`` (optional)
       - 
     * - ``<hintgroup>`` (optional)
       - 

**Tag:** ``<textline />``

Creates a response field in the LMS where the student enters a response.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - label (required)
       - Contains the text of the problem.
     * - size (optional)
       - Specifies the size, in characters, of the response field in the LMS.
     * - hidden (optional)
       - If set to "true", students cannot see the response field.
     * - correct_answer (optional)
       - Lists the correct answer to the problem.

**Tag:** ``<additional_answer>``

Specifies an additional correct answer for the problem. A problem can contain an unlimited number of additional answers.

**Tag:** ``<hintgroup>``

Indicates that the instructor has provided hints for certain common incorrect answers.

  Children

  .. list-table::
     :widths: 20 80

     * - Child
       - Description
     * - ``<stringhint>`` (required)
       - 

**Tag:** ``<stringhint>``

Specifies a common incorrect answer to the problem.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - answer (required)
       - The text of the incorrect answer.
     * - name (required)
       - The name of the hint that you want to provide.
     * - type
       - Specifies whether the text of the specified incorrect answer is case sensitive. Can be set to "cs" (case sensitive) or "ci" (case insensitive).

  Children

  .. list-table::
     :widths: 20 80

     * - Child
     * - ``<hintpart>`` (required)

**Tag:** ``<hintpart>``

Associates a common incorrect answer with the hint for that incorrect answer.

  Attributes

  .. list-table::
     :widths: 20 80

     * - Attribute
       - Description
     * - on
       - The name of the hint. This must be the same as the **name** attribute of the ``<stringhint>`` tag. (The ``<stringhint>`` tag provides the name of the hint and the incorrect answer to associate with the hint. The ``<hintpart>`` tag contains the name of the hint and the text of the hint.)

  Children

  .. list-table::
     :widths: 20 

     * - Child
     * - ``<startouttext />`` (required)
     * - ``<endouttext />`` (required)

**Tags:** ``<startouttext />`` and ``<endouttext>``

Surround the text of the hint.




