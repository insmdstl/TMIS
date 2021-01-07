<?php
/**

*/
/**
* Class iHRIS_Module_TrainingModule
*
* @access public
*/


class iHRIS_Module_TrainingModules extends I2CE_Module {

    public static function getMethods() {
        return array(
            'iHRIS_PageView->action_training_modules' => 'action_training_modules'
                     );
    }

    public function action_training_modules($obj) {
        if (!$obj instanceof iHRIS_PageView) {
            return;
        }
        return $obj->addChildForms('training_modules', 'siteContent');
    }
}
# Local Variables:
# mode: php
# c-default-style: "bsd"
# indent-tabs-mode: nil
# c-basic-offset: 4
# End:
