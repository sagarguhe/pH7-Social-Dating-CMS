<?php
/**
 * @author         Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright      (c) 2012-2015, Pierre-Henry Soria. All Rights Reserved.
 * @license        GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package        PH7 / App / System / Module / Game / Form / Processing
 */
namespace PH7;
defined('PH7') or die('Restricted access');

use
PH7\Framework\Mvc\Model\Engine\Db,
PH7\Framework\Image\Image,
PH7\Framework\Util\Various,
PH7\Framework\Url\Header,
PH7\Framework\Mvc\Router\Uri;

class AdminFormProcess extends Form
{

    public function __construct()
    {
        parent::__construct();

        // Thumbnail
        $oImg = new Image($_FILES['thumb']['tmp_name']);
        if (!$oImg->validate())
        {
            \PFBC\Form::setError('form_game', Form::wrongImgFileTypeMsg());
            return; // Stop execution of the method.
        }

        $sThumbFile = Various::genRnd($oImg->getFileName(), 30) . $oImg->getExt();
        $sThumbDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'game/img/thumb/';

        $oImg->square(60);
        $oImg->save($sThumbDir . $sThumbFile);
        unset($oImg);

        // Game
        $sGameFile = Various::genRnd($_FILES['file']['name'], 30) . PH7_DOT . $this->file->getFileExt($_FILES['file']['name']);
        $sGameDir =  PH7_PATH_PUBLIC_DATA_SYS_MOD . 'game/file/';

        // If the folders is not created (games not installed), yet we will create.
        $this->file->createDir( array($sThumbDir, $sGameDir) );

        if (!@move_uploaded_file($_FILES['file']['tmp_name'], $sGameDir . $sGameFile))
        {
            \PFBC\Form::setError('form_game', t('Impossible to upload the game. If you are the administrator, please check if the folder of games data has the write permission (CHMOD 755).'));
        }
        else
        {
            $aData = [
                'category_id' => $this->httpRequest->post('category_id', 'int'),
                'name' => $this->httpRequest->post('name'),
                'title' => $this->httpRequest->post('title'),
                'description' => $this->httpRequest->post('description'),
                'keywords' => $this->httpRequest->post('keywords'),
                'thumb' => $sThumbFile,
                'file' => $sGameFile
            ];

            (new GameModel)->add($aData);

            /* Clean GameModel Cache */
            (new Framework\Cache\Cache)->start(GameModel::CACHE_GROUP, null, null)->clear();

            Header::redirect(Uri::get('game', 'main', 'game', $aData['title'].','.Db::getInstance()->lastInsertId()), t('The game was added successfully!'));
        }
    }

}

