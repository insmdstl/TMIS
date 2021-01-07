<?php
/**

*/
/**
* Class iHRIS_Module_TrainingCurriculum
*
* @access public
*/


class iHRIS_Module_TrainingCurriculum extends I2CE_Module {

    public static function getMethods() {
        return array(
            'iHRIS_PageView->action_training_curriculum' => 'action_training_curriculum'
                     );
    }

    public function action_training_curriculum($obj) {
        if (!$obj instanceof iHRIS_PageView) {
            return;
        }
        return $obj->addChildForms('training_curriculum', 'siteContent');
    }
}
# Local Variables:
# mode: php
# c-default-style: "bsd"
# indent-tabs-mode: nil
# c-basic-offset: 4
# End:
