import { ActionEvent } from '@hotwired/stimulus';
import * as Turbo from '@hotwired/turbo';

import Controller from '$root/app/typescript/support/controller';
import { post } from '$root/app/typescript/support/http';
export default class extends Controller {
  static targets = [
    'recipeList',
    'recipeDetails',
    'newRecipe',
    'title',
    'assign',
  ];
  declare readonly recipeListTarget: HTMLDivElement;
  declare readonly recipeDetailsTarget: HTMLDivElement;
  declare readonly newRecipeTarget: HTMLDivElement;
  declare readonly titleTarget: HTMLHeadingElement;
  declare readonly assignTarget: HTMLAnchorElement;

  static values = { calendarId: String };
  declare readonly calendarIdValue: string;

  declare windowWidth: number;
  declare selectedRecipe: HTMLElement | null;
  declare selectedButton: HTMLElement | null;
  declare selectedDate: string | null;

  connect() {
    this.windowWidth =
      window.innerWidth ||
      document.documentElement.clientWidth ||
      document.body.clientWidth;
    window.addEventListener('resize', this.handleResize);
  }

  public setDate({ target, params }: ActionEvent): void {
    this.selectedButton = target as HTMLElement;
    this.selectedDate = params.date;
    this.titleTarget.innerText = `Assign recipe for ${new Date(
      params.date.replace(/-/g, '.')
    ).toLocaleDateString('en-US', {
      weekday: 'long',
      month: 'long',
      day: 'numeric',
    })}`;
  }

  public selectRecipe(e: ActionEvent): void {
    if (this.selectedRecipe != null) {
      this.removeClass(this.selectedRecipe as HTMLElement, 'bg-indigo-800');
    }
    this.selectedRecipe = e.currentTarget as HTMLElement;
    this.addClass(this.selectedRecipe as HTMLElement, 'bg-indigo-800');
    if (this.windowWidth < 1024) {
      this.hide(this.recipeListTarget);
      this.show(this.recipeDetailsTarget);
    }
    this.show(this.assignTarget);
  }

  public createDay(e: ActionEvent): void {
    post(new URL(e.params.url).pathname, {
      body: {
        day: {
          when: this.selectedDate,
          recipe_id: this.selectedRecipe!.id,
        },
        button: this.selectedButton.id,
      },
      headers: {
        Accept: 'text/vnd.turbo-stream.html',
        'Content-Type': 'application/json',
      },
    })
      .then((response) => response.text())
      .then((response) => {
        Turbo.renderStreamMessage(response);
        this.initialSetup();
      });
  }

  public backToList(): void {
    this.removeClass(this.selectedRecipe as HTMLElement, 'bg-indigo-800');
    this.selectedRecipe = null;
    this.show(this.recipeListTarget);
    this.hide(this.recipeDetailsTarget);
  }

  private handleResize = (): void => {
    this.windowWidth = window.innerWidth;
    if (this.windowWidth > 1024) {
      this.show(this.recipeListTarget);
      this.show(this.recipeDetailsTarget);
    }
    if (this.windowWidth < 1024) {
      if (this.selectedRecipe) {
        this.hide(this.recipeListTarget, 'flex');
        this.show(this.recipeDetailsTarget, 'lg:flex');
      } else {
        this.show(this.recipeListTarget, 'flex');
        this.hide(this.recipeDetailsTarget, 'flex');
      }
    }
  };

  private initialSetup(): void {
    this.removeClass(this.selectedRecipe as HTMLElement, 'bg-indigo-200');
    this.show(this.recipeListTarget);
    this.hide(this.recipeDetailsTarget);
    this.hide(this.newRecipeTarget);
    document.getElementById('recipe-details')!.innerHTML = `
            <recipe-placeholder calendarId=${this.calendarIdValue}></recipe-placeholder>
    `;
  }
}
