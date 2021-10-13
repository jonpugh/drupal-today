<?php

namespace Drupal\drupal_today\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a recent users block.
 *
 * @Block(
 *   id = "drupal_today_recent_users",
 *   admin_label = @Translation("Recent Users"),
 *   category = @Translation("Drupal Today")
 * )
 */
class RecentUsersBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build['content'] = [
      '#markup' => $this->t('It works!'),
    ];
    return $build;
  }

}
