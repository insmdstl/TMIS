<?php
/**
* © Copyright 2020 HRH2030 Timor-Leste
* 
* This File is part of I2CE 
*
* @package ihris-train
* @author HRH2030 Timor-Leste
*/
/**
* Class iHRIS_Module_JobCategory
*
* @access public
*/


class iHRIS_Module_TrainingSponsor extends I2CE_Module {

  
    public static function getMethods() {
        return array(
            'iHRIS_PageView->action_training_sponsor' => 'action_training_sponsor'
            );
    }


    public function action_training_sponsor($obj) {
        if (!$obj instanceof iHRIS_PageView) {
            return;
        }
        return $obj->addChildForms('training_sponsor', 'siteContent');
    }
    

    /**
     * @var boolean a flag to determine if migrate needs to be called during the upgrade method.
     */
    protected $do_migrate;

    /**
     * Perform any pre migrate actions for this module.
     * This is for going from pre 4.1.8 versions where classifications were saved to entry storage.
     * @return boolean
     */
    protected function pre_migrate() {
        $migrate_path = "/I2CE/formsData/migrate_data/4.1.8";
        I2CE_FormStorage::storeMigrateData( array( "provider_instance" => array( "training_sponsor" ) ), $migrate_path );
        $this->do_migrate = true;
        return true;
    }

    /**
     * Perform the migrate actions for this module.
     * @return boolean
     */
    protected function migrate() {
        $user = new I2CE_User( 1, false, false, false );
        $class_config = I2CE::getConfig()->modules->forms->formClasses;
        $migrate_path = "/I2CE/formsData/migrate_data/4.1.8";
        if ( !I2CE_FormStorage::migrateForm( "training_sponsor", "entry", $user, $migrate_path ) ) {
            return false;
        }
        if ( I2CE_ModuleFactory::instance()->isEnabled("CachedForms") ) {
            $cachedForm = new I2CE_CachedForm( "training_sponsor" );
            $cachedForm->dropTable();
        }
        if ( !I2CE_FormStorage::migrateField( "provider_instance", array( "training_sponsor" => "training_sponsor" ),
                    $migrate_path, $user ) ) {
            return false;
        }
        return true;
    }

    /**
     * Run the pre upgrade for this module.  This can use the old config data before it has 
     * been changed from the config
     * @param string $old_vers
     * @param string $new_vers
     * @param I2CE_MagicDataNode $new_storage
     * @return boolean
     */
    public function pre_upgrade( $old_vers, $new_vers, $new_storage ) {
        if ( I2CE_Validate::checkVersion( $old_vers, '<', '4.1.8.0' ) ) {
            if ( !$this->pre_migrate() ) {
                return false;
            }
        }
        return parent::pre_upgrade( $old_vers, $new_vers, $new_storage );
    }

    /**
     * Upgrade this module if necessary
     * @param string $old_vers
     * @param string $new_vers
     * @return boolean
     */
    public function post_update( $old_vers, $new_vers ) {
        /*
         * In 4.1.8 the training_classification form was moved to magicdata storage 
         * instead of entry
         */
        if ( $this->do_migrate ) {
            if ( !$this->migrate() ) {
                return false;
            }
        }
        return parent::post_update( $old_vers, $new_vers );
    }



}
# Local Variables:
# mode: php
# c-default-style: "bsd"
# indent-tabs-mode: nil
# c-basic-offset: 4
# End:
