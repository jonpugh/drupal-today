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
 *
 * )
 */
class RecentUsersBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {

    $query = \Drupal::entityQuery('user');
    $group = $query
      ->orConditionGroup()
      ->condition('login', '0', '>');

    $results = $query->condition($group)
      ->condition('status', 1)
      ->sort('login', DESC)
      ->execute();

    $build['users'] = [
      '#theme' => 'item_list',
    ];

    $users = \Drupal\user\Entity\User::loadMultiple($results);
    foreach ($users as $account) {
      $build['users']['#items'][] = [
        'name' => $account->toLink()->toRenderable(),
        'last' => [
          '#prefix' => '<div><em>',
          '#suffix' => '</em></div>',
          '#markup' => $this->t('Last Login: %login', [
            '%login' => date($account->getLastLoginTime()),
          ])
        ],
      ];
      $build['#cache'] = [
        'disabled' => TRUE
      ];

    }

    return $build;
  }

}
